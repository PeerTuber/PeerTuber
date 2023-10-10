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
  final bool isStateChange;

  const PlayMedia({required this.video, this.isStateChange = true});

  @override
  List<Object> get props => [video, isStateChange];
}

class PauseMedia extends MediaPlayerEvent {
  final VideoEntity video;

  const PauseMedia({required this.video});

  @override
  List<Object> get props => [video];
}

class UpdatePostion extends MediaPlayerEvent {
  final Duration position;

  const UpdatePostion({required this.position});

  @override
  List<Object> get props => [position];
}

class StopMedia extends MediaPlayerEvent {
  final bool? closePlayer;

  const StopMedia({this.closePlayer});
}

class EndMedia extends MediaPlayerEvent {
  final VideoEntity video;

  const EndMedia({required this.video});

  @override
  List<Object> get props => [video];
}

class MinimizePlayer extends MediaPlayerEvent {}

class MaximizePlayer extends MediaPlayerEvent {}

class UpdateSuggestedVideos extends MediaPlayerEvent {
  final List<VideoEntity> videos;

  const UpdateSuggestedVideos({required this.videos});

  @override
  List<Object> get props => [videos];
}
