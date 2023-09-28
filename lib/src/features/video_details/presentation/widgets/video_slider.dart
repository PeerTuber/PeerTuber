import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';

class VideoSlider extends StatelessWidget {
  const VideoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Builder
    return BlocBuilder<MediaPlayerBloc, MediaPlayerState>(
      buildWhen: (previous, current) =>
          [MediaPlayerPlaying].contains(current.runtimeType),
      builder: (context, state) {
        if (state is! MediaPlayerPlaying) return const SizedBox.shrink();

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
              value: progress,
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary),
            ),
          ],
        );
      },
    );
  }
}
