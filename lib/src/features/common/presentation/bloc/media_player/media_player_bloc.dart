import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:injectable/injectable.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:miniplayer/miniplayer.dart';

part 'media_player_event.dart';
part 'media_player_state.dart';

@injectable
class MediaPlayerBloc extends Bloc<MediaPlayerEvent, MediaPlayerState> {
  final VideoController controller;
  final MiniplayerController miniController;
  late StreamSubscription playerStream;
  late StreamSubscription playerPositionStream;

  MediaPlayerBloc({required this.controller, required this.miniController})
      : super(MediaPlayerNotLoaded()) {
    // Event Listeners
    on<LoadMedia>(_onLoadMedia);
    on<PlayMedia>(_onPlayMedia, transformer: restartable());
    on<PauseMedia>(_onPauseMedia);
    on<StopMedia>(_onStopMedia);
    on<EndMedia>(_onEndMedia);
    on<MinimizePlayer>(_onMinimizePlayer);
    on<UpdatePostion>(_onUpdatePosition);

    playerStream = controller.player.stream.playing
        .asBroadcastStream()
        .listen((bool isPlaying) {
      if (isPlaying) {
        // Check if the video is paused and if so, play it.
        if ([MediaPlayerPaused].contains(state.runtimeType)) {
          add(PlayMedia(video: (state as MediaPlayerPaused).video));
        }
      } else {
        // Check if the video is playing and if so, pause it.
        if ([MediaPlayerPlaying].contains(state.runtimeType)) {
          if (controller.player.state.position.inSeconds > 0) {
            add(PauseMedia(video: (state as MediaPlayerPlaying).video));
          }
        }
      }
    });

    playerPositionStream =
        controller.player.stream.position.listen((Duration position) {
      if (state is MediaPlayerPlaying) {
        if (position.inSeconds > 0) {
          add(UpdatePostion(position: position));
        }
      }
      //add(UpdatePostion(position: position));
    });
  }

  void _onLoadMedia(LoadMedia event, Emitter<MediaPlayerState> emit) {
    // Check if media is playing
    if (state is MediaPlayerPlaying || state is MediaPlayerPaused) {
      // Check if the video playing is the same one being loaded
      if (state is MediaPlayerPlaying &&
          event.video.id == (state as MediaPlayerPlaying).video.id) {
        controller.player.play();
        return;
      }
    }

    emit(MediaPlayerLoaded(video: event.video));
  }

  void _onPlayMedia(PlayMedia event, Emitter<MediaPlayerState> emit) async {
    // Check if media isn't playing and not paused
    if (!controller.player.state.playing &&
        state is! MediaPlayerPlaying &&
        state is! MediaPlayerPaused) {
      if (event.video.streamingPlaylists!.isNotEmpty) {
        await controller.player.open(
            Media(event.video.streamingPlaylists![0].playlistUrl),
            play: true);
      } else {
        return;
      }
    }
    // Media is loaded and playing / paused
    else if (state is MediaPlayerPlaying || state is MediaPlayerPaused) {
      final video = (state is MediaPlayerPlaying)
          ? (state as MediaPlayerPlaying).video
          : (state as MediaPlayerPaused).video;

      // check if the videos are the same
      if (event.video.id != video.id) {
        controller.player.stop();
        // The videos are different, load the new video
        await controller.player.open(
            Media(event.video.streamingPlaylists![0].playlistUrl),
            play: true);

        return;
      } else {
        controller.player.play();
      }
    } // Media is queued for playing, play it now
    else if (state is MediaPlayerLoaded) {
      if (event.video.streamingPlaylists!.isEmpty) {
        return;
      }

      await controller.player.open(
          Media(event.video.streamingPlaylists![0].playlistUrl),
          play: true);
    }

    emit(MediaPlayerPlaying(
        video: event.video, seekPosition: const Duration(seconds: 0)));
  }

  void _onPauseMedia(PauseMedia event, Emitter<MediaPlayerState> emit) {
    emit(MediaPlayerPaused(video: event.video));

    controller.player.pause();
  }

  void _onStopMedia(StopMedia event, Emitter<MediaPlayerState> emit) {
    if (controller.player.state.playing) {
      controller.player.stop();
    }

    emit(MediaPlayerNotLoaded());
  }

  void _onEndMedia(EndMedia event, Emitter<MediaPlayerState> emit) {
    emit(MediaPlayerEnded(video: event.video));
  }

  void _onMinimizePlayer(MinimizePlayer event, Emitter<MediaPlayerState> emit) {
    miniController.animateToHeight(state: PanelState.MIN);
  }

  void _onUpdatePosition(UpdatePostion event, Emitter<MediaPlayerState> emit) {
    if (state is MediaPlayerPlaying) {
      emit(MediaPlayerPlaying(
          video: (state as MediaPlayerPlaying).video,
          seekPosition: event.position));
    }
  }

  @override
  Future<void> close() {
    playerStream.cancel();
    playerPositionStream.cancel();
    return super.close();
  }
}
