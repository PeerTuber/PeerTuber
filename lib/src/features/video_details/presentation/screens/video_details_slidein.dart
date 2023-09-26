import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';
import 'package:peertuber/src/features/video_details/presentation/widgets/mini_player_content.dart';
import 'package:peertuber/src/features/video_details/presentation/screens/video_details.dart';
import 'package:miniplayer/miniplayer.dart';

class VideoDetailsSlidein extends HookWidget {
  final Function? onSlideIn;
  final Function? onSlideOut;
  const VideoDetailsSlidein({
    super.key,
    this.onSlideIn,
    this.onSlideOut,
  });

  static const double _playerMinHeight = 160.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaPlayerBloc, MediaPlayerState>(
        buildWhen: (_, state) => [
              MediaPlayerLoaded,
              MediaPlayerPlaying,
              MediaPlayerPaused,
              MediaPlayerNotLoaded,
            ].contains(state.runtimeType),
        builder: (context, state) {
          final miniController = context.read<MediaPlayerBloc>().miniController;
          final videoController = context.read<MediaPlayerBloc>().controller;

          if (state is MediaPlayerLoaded) {
            return Miniplayer(
                controller: miniController,
                minHeight: _playerMinHeight + 4,
                maxHeight: MediaQuery.of(context).size.height,
                elevation: 100,
                builder: (height, percentage) {
                  // Let's check if the video is not playing and not paused
                  // and if the mini player is not expanded, then we expand it.
                  if (state is! MediaPlayerPlaying &&
                      state is! MediaPlayerPaused) {
                    if (percentage == 0) {
                      miniController.animateToHeight(state: PanelState.MAX);
                    }
                  }

                  // Check mini player height and set the proper navbar
                  // animation.
                  if (height > _playerMinHeight + 40.0) {
                    onSlideIn?.call();
                    //_animationController.animateTo(0.15);

                    return VideoDetails(
                      video: state.video,
                      videoController: videoController,
                      playerState: state,
                    );
                  } else {
                    //_animationController.animateTo(-10.5);
                    onSlideOut?.call();
                    return MiniPlayerContent(
                      controller: videoController,
                      video: state.video,
                      playerState: state,
                    );
                  }
                });
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
