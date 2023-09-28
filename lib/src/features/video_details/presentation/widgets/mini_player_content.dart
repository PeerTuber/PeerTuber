import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';

class MiniPlayerContent extends StatelessWidget {
  final VideoEntity? video;
  const MiniPlayerContent({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = context.read<MediaPlayerBloc>();

    return Column(children: [
      Row(
        children: [
          SizedBox(
            height: 60,
            width: 100.0,
            // Use [Video] widget to display video output.
            child: Video(
              controller: mediaPlayerBloc.controller,
              controls: NoVideoControls,
              fit: BoxFit.fitHeight,
              fill: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      video!.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      video!.channel.displayName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<MediaPlayerBloc>().add(StopMedia());
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      BlocBuilder<MediaPlayerBloc, MediaPlayerState>(
        buildWhen: (previous, current) =>
            previous.runtimeType == MediaPlayerPlaying,
        builder: (context, state) {
          if (state is! MediaPlayerPlaying) {
            return const SizedBox.shrink();
          }

          var progress = ((state.seekPosition.inSeconds /
                      mediaPlayerBloc
                          .controller.player.state.duration.inSeconds) *
                  100) *
              0.01;

          if (progress.isNaN) {
            progress = 0;
          }
          return LinearProgressIndicator(
            value: progress,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary),
          );
        },
      )
    ]);
  }
}
