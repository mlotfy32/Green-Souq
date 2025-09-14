import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class VoiceCallPage extends StatefulWidget {
  final String role; // "caller" or "callee"
  const VoiceCallPage({super.key, required this.role});

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
  late RTCPeerConnection _peerConnection;
  late MediaStream _localStream;
  final _channel = WebSocketChannel.connect(
    Uri.parse("ws://YOUR_SERVER_IP:8080"), // WebSocket signaling server
  );

  @override
  void initState() {
    super.initState();
    _initWebRTC();
  }

  Future<void> _initWebRTC() async {
    // 1- إعداد PeerConnection
    final config = {
      "iceServers": [
        {"urls": "stun:stun.l.google.com:19302"},
      ],
    };
    _peerConnection = await createPeerConnection(config);

    // 2- الحصول على المايكروفون
    _localStream = await navigator.mediaDevices.getUserMedia({
      "audio": true,
      "video": false,
    });
    _peerConnection.addStream(_localStream);

    // 3- استقبال ICE candidates
    _peerConnection.onIceCandidate = (candidate) {
      if (candidate != null) {
        _channel.sink.add(
          jsonEncode({"type": "candidate", "candidate": candidate.toMap()}),
        );
      }
    };

    // 4- استقبال Remote Stream
    _peerConnection.onAddStream = (stream) {
      print("✅ Remote stream received: ${stream.id}");
    };

    // 5- الاستماع لرسائل WebSocket
    _channel.stream.listen((message) async {
      final data = jsonDecode(message);
      if (data["type"] == "offer" && widget.role == "callee") {
        await _peerConnection.setRemoteDescription(
          RTCSessionDescription(data["sdp"], "offer"),
        );
        final answer = await _peerConnection.createAnswer();
        await _peerConnection.setLocalDescription(answer);
        _channel.sink.add(jsonEncode({"type": "answer", "sdp": answer.sdp}));
      } else if (data["type"] == "answer" && widget.role == "caller") {
        await _peerConnection.setRemoteDescription(
          RTCSessionDescription(data["sdp"], "answer"),
        );
      } else if (data["type"] == "candidate") {
        final candidate = RTCIceCandidate(
          data["candidate"]["candidate"],
          data["candidate"]["sdpMid"],
          data["candidate"]["sdpMLineIndex"],
        );
        await _peerConnection.addCandidate(candidate);
      }
    });

    // 6- لو المستخدم Caller يبدأ الاتصال
    if (widget.role == "caller") {
      final offer = await _peerConnection.createOffer();
      await _peerConnection.setLocalDescription(offer);
      _channel.sink.add(jsonEncode({"type": "offer", "sdp": offer.sdp}));
    }
  }

  @override
  void dispose() {
    _peerConnection.close();
    _localStream.dispose();
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Voice Call (${widget.role})")),
      body: const Center(child: Text("🎤 Voice call in progress...")),
    );
  }
}
