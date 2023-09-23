import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
import 'package:flutter_peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:flutter_peertuber/src/features/video_details/domain/usecases/get_video_details.dart';
import 'package:injectable/injectable.dart';

part 'video_details_event.dart';
part 'video_details_state.dart';

@injectable
class VideoDetailsBloc extends Bloc<VideoDetailsEvent, VideoDetailsState> {
  final GetVideoDetailsUseCase getVideoDetails;
  VideoDetailsBloc({required this.getVideoDetails})
      : super(VideoDetailsLoading()) {
    on<GetVideoDetailsEvent>(_onGetVideoDetails);
    on<ReloadVideoDetails>(_onReloadVideoDetails);
  }

  void _onGetVideoDetails(
      GetVideoDetailsEvent event, Emitter<VideoDetailsState> emit) async {
    final video = await getVideoDetails(VideoParams(video: event.video));

    video.fold(
      (failure) => emit(const VideoDetailsError(message: 'There was an error')),
      (video) => emit(VideoDetailsLoaded(video: video)),
    );
  }

  void _onReloadVideoDetails(
      ReloadVideoDetails event, Emitter<VideoDetailsState> emit) {
    emit(VideoDetailsLoading());
  }
}
