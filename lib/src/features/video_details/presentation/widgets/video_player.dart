import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';

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

class VideoSlider extends HookWidget {
  const VideoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final position = useState<double>(0.0);
    // Builder
    return BlocBuilder<MediaPlayerBloc, MediaPlayerState>(
      buildWhen: (previous, current) =>
          [MediaPlayerPlaying, MediaPlayerPaused].contains(current.runtimeType),
      builder: (context, state) {
        if (state is MediaPlayerPlaying) {
          final seekPosition = state.seekPosition;
          var progress = ((seekPosition.inSeconds /
                      context
                          .read<MediaPlayerBloc>()
                          .controller
                          .player
                          .state
                          .duration
                          .inSeconds) *
                  100) *
              0.01;

          if (progress.isNaN || progress.isInfinite) {
            progress = 0;
          }

          position.value = progress;
        }

        return Stack(
          children: [
            /*Slider(
              value: progress,
              max: 1,
              min: 0,
              onChanged: (value) => {},
              onChangeEnd: (value) => player.seek(Duration(
                  seconds: (value * player.state.duration.inSeconds).toInt())),
            ),*/
            LinearProgressIndicator(
              value: position.value,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary),
            ),
          ],
        );
      },
    );
  }
}

class MiniPlayerControls extends StatelessWidget {
  const MiniPlayerControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaPlayerBloc, MediaPlayerState>(
      buildWhen: (previous, current) => [
        MediaPlayerPlaying,
        MediaPlayerPaused,
      ].contains(current.runtimeType),
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              state is MediaPlayerPlaying
                  ? context
                      .read<MediaPlayerBloc>()
                      .add(PauseMedia(video: state.video))
                  : (state is MediaPlayerPaused)
                      ? context
                          .read<MediaPlayerBloc>()
                          .add(PlayMedia(video: state.video))
                      : null;
            },
            icon: state is MediaPlayerPlaying
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow));
      },
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

class VideoPlayerControls extends HookWidget {
  const VideoPlayerControls({
    required this.state,
    super.key,
  });

  final VideoState state;

  @override
  Widget build(BuildContext context) {
    final showControls = useState<bool>(false);

    return showControls.value
        ? SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => showControls.value = !showControls.value,
                  child: const AbsorbPointer(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      context.read<MediaPlayerBloc>().add(MinimizePlayer()),
                  iconSize: 30.0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      state.widget.controller.player.playOrPause();
                    },
                    icon: StreamBuilder(
                      stream: state.widget.controller.player.stream.playing,
                      builder: (context, playing) => Icon(
                        playing.data == true ? Icons.pause : Icons.play_arrow,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () => showControls.value = !showControls.value,
            child: const AbsorbPointer(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          );
  }
}
