part of 'media_player_bloc.dart';

sealed class MediaPlayerState extends Equatable {
  const MediaPlayerState();

  @override
  List<Object> get props => [];
}

final class MediaPlayerNotLoaded extends MediaPlayerState {}

final class MediaPlayerLoaded extends MediaPlayerState {
  final VideoEntity video;
  final List<VideoEntity> videoSuggestions;

  const MediaPlayerLoaded(
      {required this.video, this.videoSuggestions = const <VideoEntity>[]});

  @override
  List<Object> get props => [video, videoSuggestions];
}

final class MediaPlayerPlaying extends MediaPlayerLoaded {
  final Duration seekPosition;

  const MediaPlayerPlaying({required super.video, required this.seekPosition});

  @override
  List<Object> get props => [seekPosition, video];
}

final class MediaPlayerBuffering extends MediaPlayerLoaded {
  const MediaPlayerBuffering({required super.video});

  @override
  List<Object> get props => [video];
}

final class MediaPlayerPaused extends MediaPlayerLoaded {
  const MediaPlayerPaused({required super.video});

  @override
  List<Object> get props => [video];
}

final class MediaPlayerEnded extends MediaPlayerLoaded {
  const MediaPlayerEnded({required super.video});

  @override
  List<Object> get props => [video];
}
