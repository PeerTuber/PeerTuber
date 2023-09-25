part of 'search_videos_bloc.dart';

sealed class SearchVideosState extends Equatable {
  const SearchVideosState();

  @override
  List<Object> get props => [];
}

final class SearchVideosInitial extends SearchVideosState {}

final class SearchVideosLoading extends SearchVideosState {}

final class SearchVideosError extends SearchVideosState {
  final String message;

  const SearchVideosError({required this.message});

  @override
  List<Object> get props => [message];
}

final class SearchVideosLoaded extends SearchVideosState {
  final List<VideoEntity> videos;

  const SearchVideosLoaded({required this.videos});

  @override
  List<Object> get props => [videos];
}
