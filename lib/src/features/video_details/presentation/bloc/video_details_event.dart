part of 'video_details_block.dart';

sealed class VideoDetailsEvent extends Equatable {
  const VideoDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetVideoDetailsEvent extends VideoDetailsEvent {
  final VideoEntity video;

  const GetVideoDetailsEvent({required this.video});

  @override
  List<Object> get props => [video];
}

class OnVideoDetails extends VideoDetailsEvent {
  final VideoEntity video;

  const OnVideoDetails({required this.video});

  @override
  List<Object> get props => [video];
}

class ReloadVideoDetails extends VideoDetailsEvent {}
