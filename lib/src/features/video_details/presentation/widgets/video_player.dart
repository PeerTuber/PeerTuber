import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_peertuber/src/core/bloc/instance/instance_cubit.dart';
import 'package:flutter_peertuber/src/core/bloc/media_player/media_player_bloc.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends HookWidget {
  final VideoEntity video;
  final VideoController controller;
  final MediaPlayerState playerState;

  const VideoPlayer({
    Key? key,
    required this.video,
    required this.controller,
    required this.playerState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instance = useState(context.read<InstanceCubit>().state.instance);
    var showThumbnail = useState(
        controller.player.state.position <= const Duration(milliseconds: 200));

    final thumbnailPath = (video.remoteHost != null)
        ? '${video.remoteHost}${video.thumbnailPath}'
        : '${instance.value.host}${video.thumbnailPath}';

    useEffect(() {
      var oldVideo = video;
      var newVideo = (playerState as MediaPlayerLoaded).video;

      if (newVideo.id != oldVideo.id) {
        // Load Video (Enter the play state)
        context.read<MediaPlayerBloc>().add(PlayMedia(video: newVideo));
        return null;
      }

      // Check if this video is already loaded and paused
      if (playerState is MediaPlayerPlaying ||
          playerState is MediaPlayerPaused) {
        // check if the videos are the same
        if (video.id == (playerState as MediaPlayerLoaded).video.id ||
            playerState is MediaPlayerLoaded) {
          return null;
        }
      }
      // Load Video (Enter the play state)
      context.read<MediaPlayerBloc>().add(PlayMedia(video: video));

      return null;
    });

    // Handle playing events
    useEffect(() {
      final sub = controller.player.stream.playing.listen((isPlaying) {
        if (!isPlaying && playerState is MediaPlayerPlaying) {
          context.read<MediaPlayerBloc>().add(PauseMedia(video: video));
        } else if (isPlaying && playerState is! MediaPlayerPlaying) {
          context.read<MediaPlayerBloc>().add(PlayMedia(video: video));
        }
      });

      return sub.cancel;
    }, [controller.player.stream.playing]);

    // Get the time position of the video
    // Show or hide the thumbnail based on the position.
    useEffect(() {
      final sub = controller.player.stream.position.listen((position) {
        if (position <= const Duration(milliseconds: 200)) {
          showThumbnail.value = true;
        } else {
          showThumbnail.value = false;
        }

        // End media when done playing
        if (position >= controller.player.state.duration) {
          context.read<MediaPlayerBloc>().add(EndMedia(video: video));
        }
      });

      return sub.cancel;
    }, [controller.player.stream.position]);

    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9.0 / 16.0,

          // -- Video widget to display video output.
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Video(
                controller: controller,
                controls: MaterialVideoControls,
                fill: Colors.black,
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        showThumbnail.value && (playerState is! MediaPlayerPaused)
            ? Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: thumbnailPath,
                    height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                    errorWidget: (_, __, ___) {
                      return Container(
                        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
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
            : const SizedBox.shrink(),
        IconButton(
          onPressed: () =>
              context.read<MediaPlayerBloc>().add(MinimizePlayer()),
          iconSize: 30.0,
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
      ],
    );
  }
}
