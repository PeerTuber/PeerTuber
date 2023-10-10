import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:peertuber/src/features/video_details/domain/repositories/video_details_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetVideoDetailsUseCase
    implements UseCase<Future<Either<Failure, VideoEntity>>, VideoParams> {
  final VideoDetailsRepository repository;

  GetVideoDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, VideoEntity>> call(VideoParams params) async {
    if (params.video.isLocal == null) {
      return await repository.getVideoDetailsByUrl(
          params.video.url!, params.video.uuid!);
    } else {
      return await repository.getVideoDetailsById(params.video.id);
    }
  }
}
