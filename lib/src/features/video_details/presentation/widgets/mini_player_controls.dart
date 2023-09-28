import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';

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
