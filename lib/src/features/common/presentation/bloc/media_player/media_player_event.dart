part of 'media_player_bloc.dart';

sealed class MediaPlayerEvent extends Equatable {
  const MediaPlayerEvent();

  @override
  List<Object> get props => [];
}

class LoadMedia extends MediaPlayerEvent {
  final VideoEntity video;

  const LoadMedia({required this.video});

  @override
  List<Object> get props => [video];
}

class PlayMedia extends MediaPlayerEvent {
  final VideoEntity video;

  const PlayMedia({required this.video});

  @override
  List<Object> get props => [video];
}

class PauseMedia extends MediaPlayerEvent {
  final VideoEntity video;

  const PauseMedia({required this.video});

  @override
  List<Object> get props => [video];
}

class StopMedia extends MediaPlayerEvent {}

class EndMedia extends MediaPlayerEvent {
  final VideoEntity video;

  const EndMedia({required this.video});

  @override
  List<Object> get props => [video];
}

class MinimizePlayer extends MediaPlayerEvent {}

class UpdateSuggestedVideos extends MediaPlayerEvent {
  final List<VideoEntity> videos;

  const UpdateSuggestedVideos({required this.videos});

  @override
  List<Object> get props => [videos];
}
