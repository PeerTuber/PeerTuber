part of 'video_details_block.dart';

sealed class VideoDetailsState extends Equatable {
  const VideoDetailsState();

  @override
  List<Object> get props => [];
}

final class VideoDetailsLoading extends VideoDetailsState {}

final class VideoDetailsLoaded extends VideoDetailsState {
  final VideoEntity video;

  const VideoDetailsLoaded({required this.video});

  @override
  List<Object> get props => [video];
}

final class VideoDetailsError extends VideoDetailsState {
  final String message;

  const VideoDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
