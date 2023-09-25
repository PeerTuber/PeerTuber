part of 'search_videos_bloc.dart';

sealed class SearchVideosEvent extends Equatable {
  const SearchVideosEvent();

  @override
  List<Object> get props => [];
}

class PerformSearchVideosEvent extends SearchVideosEvent {
  final SearchDataEntity searchData;
  const PerformSearchVideosEvent({required this.searchData});

  @override
  List<Object> get props => [searchData];
}

class ResetSearchEvent extends SearchVideosEvent {}
