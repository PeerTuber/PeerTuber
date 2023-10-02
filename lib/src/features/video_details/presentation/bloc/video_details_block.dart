import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:peertuber/src/features/video_details/domain/usecases/get_video_details.dart';
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/features/video_details/domain/usecases/get_video_details_stream.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

part 'video_details_event.dart';
part 'video_details_state.dart';

@injectable
class VideoDetailsBloc extends Bloc<VideoDetailsEvent, VideoDetailsState> {
  final GetVideoDetailsUseCase getVideoDetails;
  final GetVideoDetailsStreamUseCase getVideoDetailsStream;
  final PanelController panelController;

  VideoDetailsBloc({
    required this.getVideoDetails,
    required this.getVideoDetailsStream,
    required this.panelController,
  }) : super(VideoDetailsLoading()) {
    on<GetVideoDetailsEvent>(_onGetVideoDetails);
    on<ReloadVideoDetails>(_onReloadVideoDetails);
    on<OnVideoDetails>(_onVideoDetails);
  }

  void _onGetVideoDetails(
      GetVideoDetailsEvent event, Emitter<VideoDetailsState> emit) async {
    final video = await getVideoDetails(VideoParams(video: event.video));

    video.fold(
      (failure) => emit(const VideoDetailsError(message: 'There was an error')),
      (video) {
        emit(VideoDetailsLoaded(video: video));
      },
    );
  }

  void _onVideoDetails(
      OnVideoDetails event, Emitter<VideoDetailsState> emit) async {
    VideoDetailsLoaded(video: event.video);
  }

  void _onReloadVideoDetails(
      ReloadVideoDetails event, Emitter<VideoDetailsState> emit) {
    emit(VideoDetailsLoading());
  }
}
