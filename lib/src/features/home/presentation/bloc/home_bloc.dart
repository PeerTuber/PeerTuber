import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:peertuber/src/features/home/domain/usecases/get_home_videos.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeVideos getHomeVideos;

  HomeBloc({required this.getHomeVideos}) : super(HomeLoading()) {
    on<GetHomeVideosEvent>(_onGetHomeVideos);
  }

  // Call the GetHomeVideos usecase
  void _onGetHomeVideos(
      GetHomeVideosEvent event, Emitter<HomeState> emit) async {
    final videos = await getHomeVideos(NoParams());

    videos.fold(
      (failure) => emit(const HomeError(message: 'There was an error')),
      (videoList) => emit(HomeLoaded(videoList: videoList)),
    );
  }
}
