import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/features/services/domain/entites/disease_video_entite.dart';
import 'package:green_souq/features/services/presentation/cubit/changecourcedetailes/changecourcedetailes_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/courceDetailes.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourceSuccess extends StatefulWidget {
  const CourceSuccess({
    super.key,
    required this.cources,
    required this.diseaseName,
  });
  final String diseaseName;
  final List<DiseaseVideoEntite> cources;
  @override
  State<CourceSuccess> createState() => _CourceSuccessState();
}

class _CourceSuccessState extends State<CourceSuccess> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.cources[0].videoId) ?? '',
      flags: const YoutubePlayerFlags(autoPlay: false),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 292.3,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),
          ),
          BlocBuilder<ChangecourcedetailesCubit, ChangecourcedetailesState>(
            builder: (context, state) {
              final initialIndex = BlocProvider.of<ChangecourcedetailesCubit>(
                context,
              ).initialIndex;
              return CourceDetails(
                channelLogo: widget.cources[initialIndex].channelLogo,
                channelTitle: context.spiltstring(
                  text: widget.cources[initialIndex].channelTitle,
                ),
                publishedAt: context.spiltDate(
                  text: widget.cources[initialIndex].publishedAt,
                ),
                title: context.spiltstring(
                  text: widget.cources[initialIndex].title,
                ),
              );
            },
          ),
          SizedBox(
            height: 373.7,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: widget.cources.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  _controller.load(widget.cources[index].videoId);
                  BlocProvider.of<ChangecourcedetailesCubit>(
                    context,
                  ).changeVideoNumper(newNumper: index);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.cources[index].channelLogo,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.getWidth(context: context) - 100,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        context.spiltstring(text: widget.cources[index].title),
                        style: FontStyle.f14w400gray,
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                child: Divider(color: Colors.black12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
