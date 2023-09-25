import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/failures.dart';

abstract class HomeVideosRespository {
  Future<Either<Failure, List<VideoEntity>>> getHomeVideos();
}
