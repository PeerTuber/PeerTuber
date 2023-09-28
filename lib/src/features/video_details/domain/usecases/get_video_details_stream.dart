import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:peertuber/src/features/video_details/domain/repositories/video_details_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVideoDetailsStreamUseCase
    implements UseCase<Stream<VideoEntity?>, NoParams> {
  final VideoDetailsRepository repository;

  GetVideoDetailsStreamUseCase(this.repository);

  @override
  Stream<VideoEntity?> call(NoParams params) {
    return repository.videoDetails;
  }
}
