import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
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
  late Stream<bool> playerStream;

  MediaPlayerBloc({required this.controller, required this.miniController})
      : super(MediaPlayerNotLoaded()) {
    // Event Listeners
    on<LoadMedia>(_onLoadMedia);
    on<PlayMedia>(_onPlayMedia, transformer: restartable());
    on<PauseMedia>(_onPauseMedia);
    on<StopMedia>(_onStopMedia);
    on<EndMedia>(_onEndMedia);
    on<MinimizePlayer>(_onMinimizePlayer);
    on<UpdateSuggestedVideos>(_onUpdateSuggestedVideos);

    playerStream = controller.player.stream.playing;
  }

  void _onLoadMedia(LoadMedia event, Emitter<MediaPlayerState> emit) {
    // Check if media is playing
    if (state is MediaPlayerPlaying || state is MediaPlayerPaused) {
      // Check if the video playing is the same one being loaded
      if (state is MediaPlayerPlaying &&
          event.video.id == (state as MediaPlayerPlaying).video.id) {
        // Maximize the miniPlayer
        miniController.animateToHeight(state: PanelState.MAX);
        // Continue playing the video that was previously loaded
        controller.player.play();
        return;
      }
    }

    emit(MediaPlayerLoaded(video: event.video));
    miniController.animateToHeight(state: PanelState.MAX);
  }

  void _onPlayMedia(PlayMedia event, Emitter<MediaPlayerState> emit) async {
    // Check if media isn't playing and not paused
    if (!controller.player.state.playing &&
        state is! MediaPlayerPlaying &&
        state is! MediaPlayerPaused) {
      await controller.player.open(
          Media(event.video.streamingPlaylists![0].playlistUrl),
          play: true);
    }
    // Media is loaded and playing / paused
    else if (state is MediaPlayerPlaying || state is MediaPlayerPaused) {
      // check if the videos are the same
      if (event.video != (state as MediaPlayerLoaded).video) {
        // Unload the playing media
        emit(MediaPlayerNotLoaded());

        // Load the new media
        add(LoadMedia(video: event.video));

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

  void _onUpdateSuggestedVideos(
      UpdateSuggestedVideos event, Emitter<MediaPlayerState> emit) {
    if (state is MediaPlayerLoaded) {
      emit(MediaPlayerLoaded(
          video: (state as MediaPlayerLoaded).video,
          videoSuggestions: event.videos));
    }
  }
}
