import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';
import 'package:peertuber/src/features/video_details/presentation/screens/video_details.dart';
import 'package:miniplayer/miniplayer.dart';

class VideoDetailsSlidein extends StatelessWidget {
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
        buildWhen: (previous, current) => [
              MediaPlayerLoaded,
              MediaPlayerNotLoaded
            ].contains(current.runtimeType),
        builder: (context, state) {
          final miniController = context.read<MediaPlayerBloc>().miniController;

          if (state is! MediaPlayerLoaded) {
            return const SizedBox.shrink();
          }

          return Visibility(
            maintainState: false,
            visible: [MediaPlayerLoaded].contains(state.runtimeType),
            child: Miniplayer(
                controller: miniController,
                allowTapToClose: false,
                minHeight: _playerMinHeight + 4,
                maxHeight: MediaQuery.of(context).size.height,
                elevation: 100,
                builder: (height, percentage) {
                  if (percentage == 0) {
                    onSlideOut!();
                  } else {
                    onSlideIn!();
                  }

                  return Visibility(
                    maintainState: false,
                    child: VideoDetails(
                      video: state.video,
                      playerState: state,
                      miniPlayerPercentage: percentage,
                    ),
                  );
                }),
          );
        });
  }
}
