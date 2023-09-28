import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/features/common/domain/usecases/search_videos.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:injectable/injectable.dart';

part 'search_videos_event.dart';
part 'search_videos_state.dart';

@injectable
class SearchVideosBloc extends Bloc<SearchVideosEvent, SearchVideosState> {
  final SearchVideosUseCase searchVideos;
  SearchVideosBloc({required this.searchVideos})
      : super(SearchVideosInitial()) {
    on<PerformSearchVideosEvent>(_onPerformSearchVideos);
    on<ResetSearchEvent>(_onResetSearch);
  }

  void _onPerformSearchVideos(
      PerformSearchVideosEvent event, Emitter<SearchVideosState> emit) async {
    emit(SearchVideosLoading());

    final videoId = event.video?.id;
    final videos = await searchVideos(
        SearchParams(searchData: event.searchData, videoId: videoId));

    videos.fold(
      (failure) => emit(const SearchVideosError(message: 'There was an error')),
      (videoList) => emit(SearchVideosLoaded(videos: videoList)),
    );
  }

  void _onResetSearch(
      ResetSearchEvent event, Emitter<SearchVideosState> emit) async {
    emit(SearchVideosInitial());
  }
}
