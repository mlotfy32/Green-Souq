import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:green_souq/core/utiles/helper.dart';
part 'uplodimage_state.dart';

class UplodimageCubit extends Cubit<UplodimageState> {
  UplodimageCubit() : super(UplodimageInitial());
  getProgress({required double progress}) {
    emit(UplodimageProgress(progress: progress));
  }

  uploadImage({required String path, required ImageSource source}) async {
    final dio = Dio();
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return;

    final file = File(pickedFile.path);
    final fileName = '$path/${DateTime.now().millisecondsSinceEpoch}.png';

    const String projectUrl = "https://tnoyqwewkojfisfbgkme.supabase.co";
    const String apiKey =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRub3lxd2V3a29qZmlzZmJna21lIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcxOTU4MjYsImV4cCI6MjA3Mjc3MTgyNn0.BKbNlrYvAK7QabGH04rPiUgwjb_qWzS4xbhsittT9PA";
    const String bucket = "images";

    final url = "$projectUrl/storage/v1/object/$bucket/$fileName";

    try {
      emit(UplodimageLoading());

      final fileLength = await file.length();

      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: DioMediaType("image", "png"),
        ),
      });

      await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $apiKey",
            "Content-Type": "multipart/form-data",
            "Content-Length": fileLength.toString(),
          },
        ),
        onSendProgress: (sent, total) {
          emit(UplodimageProgress(progress: sent / total));
        },
      );
      log(url);
      Helper.FlutterToast(title: "Upload successful! ✅", success: true);
      emit(UplodimageSuccess(imageUrl: url));
    } catch (e) {
      Helper.FlutterToast(title: 'Upload error', success: false);
    }
  }
}
