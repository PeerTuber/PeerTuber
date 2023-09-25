import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';

class MiniPlayerContent extends HookWidget {
  final VideoEntity video;
  final VideoController controller;
  final MediaPlayerState playerState;
  const MiniPlayerContent(
      {super.key,
      required this.controller,
      required this.video,
      required this.playerState});

  @override
  Widget build(BuildContext context) {
    var mediaPlayerBloc = context.read<MediaPlayerBloc>();
    var videoProgress = useState<double>(0.0);
    // Get the time position of the video
    useEffect(() {
      final sub = controller.player.stream.position.listen((position) {
        var progress =
            ((position.inSeconds / controller.player.state.duration.inSeconds) *
                    100) *
                0.01;

        if (progress.isNaN) {
          videoProgress.value = 0;
        } else {
          videoProgress.value = progress;
        }
      });

      return sub.cancel;
    }, [controller.player.stream.position]);

    if (playerState is MediaPlayerLoaded) {
      return Column(children: [
        Row(
          children: [
            SizedBox(
              height: 60,
              width: 100.0,
              // Use [Video] widget to display video output.
              child: Video(
                controller: controller,
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
                        video.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        video.channel.displayName,
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
                  playerState is MediaPlayerPlaying
                      ? mediaPlayerBloc.add(PauseMedia(video: video))
                      : mediaPlayerBloc.add(PlayMedia(video: video));
                },
                icon: playerState is MediaPlayerPlaying
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow)),
            IconButton(
              onPressed: () {
                context.read<MediaPlayerBloc>().add(StopMedia());
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: videoProgress.value,
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary),
        )
      ]);
    } else {
      return const SizedBox.shrink();
    }
  }
}
