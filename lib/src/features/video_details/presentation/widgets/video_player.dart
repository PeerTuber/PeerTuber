import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';
import 'package:peertuber/src/features/video_details/presentation/widgets/widgets.dart';

class VideoPlayer extends StatelessWidget {
  final VideoEntity video;
  final double miniPlayerPercentage;

  const VideoPlayer({
    Key? key,
    required this.video,
    required this.miniPlayerPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: max(
                      MediaQuery.of(context).size.width * miniPlayerPercentage,
                      100),
                  height: max(
                      (MediaQuery.of(context).size.width * 9.0 / 16.0) *
                          miniPlayerPercentage,
                      60),

                  // -- Video widget to display video output.
                  child: _VideoWidget(
                    video: video,
                    miniPlayerPercentage: miniPlayerPercentage,
                  ),
                ),
                Expanded(
                  child: Offstage(
                    offstage: miniPlayerPercentage > 0,
                    child: Row(
                      children: [
                        Expanded(child: _MiniPlayerVideoInfo(video: video)),
                        const MiniPlayerControls(),
                        IconButton(
                          onPressed: () =>
                              context.read<MediaPlayerBloc>().add(StopMedia()),
                          iconSize: 30.0,
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            /*BlocBuilder<MediaPlayerBloc, MediaPlayerState>(
              buildWhen: (previous, current) => ![
                MediaPlayerLoaded,
                MediaPlayerPaused,
                MediaPlayerNotLoaded,
                MediaPlayerEnded
              ].contains(current.runtimeType),
              builder: (context, state) {
                final position = (state is MediaPlayerPlaying)
                    ? state.seekPosition
                    : const Duration(milliseconds: 500);
                return position <= const Duration(milliseconds: 400)
                    ? Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: thumbnailPath,
                            height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.contain,
                            errorWidget: (_, __, ___) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.width * 9.0 / 16.0,
                                width: MediaQuery.of(context).size.width,
                                color: Theme.of(context).primaryColor,
                                alignment: Alignment.center,
                                child: const Text('Error Loading Image'),
                              );
                            },
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                        ],
                      )
                    : const SizedBox.shrink();
              },
            ),*/
          ],
        ),
        Offstage(
          offstage: miniPlayerPercentage > 0,
          child: const VideoSlider(),
        ),
      ],
    );
  }
}

class _MiniPlayerVideoInfo extends StatelessWidget {
  final VideoEntity video;
  const _MiniPlayerVideoInfo({
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              video.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
          Flexible(
            child: Text(
              video.channel.displayName,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoWidget extends StatelessWidget {
  const _VideoWidget({
    required this.video,
    required this.miniPlayerPercentage,
  });

  final VideoEntity video;
  final double miniPlayerPercentage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaPlayerBloc, MediaPlayerState>(
      buildWhen: (previous, current) =>
          [MediaPlayerLoaded].contains(current.runtimeType),
      builder: (context, state) {
        final mediaPlayer = context.read<MediaPlayerBloc>();

        return Video(
            controller: mediaPlayer.controller,
            //controls: MaterialVideoControls,
            controls: (miniPlayerPercentage == 1)
                ? MaterialVideoControls
                : NoVideoControls,
            fill: Colors.black,
            alignment: Alignment.topCenter,
            fit: BoxFit.fitHeight);
      },
    );
  }
}
