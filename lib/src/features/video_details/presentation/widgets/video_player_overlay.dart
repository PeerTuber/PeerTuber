import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/media_player/media_player_bloc.dart';

class VideoPlayerOverlay extends HookWidget {
  const VideoPlayerOverlay({
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
