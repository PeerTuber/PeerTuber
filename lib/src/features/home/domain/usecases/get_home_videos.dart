import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:peertuber/src/features/home/domain/repositories/home_videos_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHomeVideos implements UseCase<List<VideoEntity>, NoParams> {
  final HomeVideosRespository repository;

  GetHomeVideos(this.repository);

  @override
  Future<Either<Failure, List<VideoEntity>>> call(NoParams params) async {
    return await repository.getHomeVideos();
  }
}
