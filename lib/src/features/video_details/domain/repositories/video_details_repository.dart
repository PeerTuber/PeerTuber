import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/failures.dart';

abstract class VideoDetailsRepository {
  Stream<VideoEntity?> get videoDetails;
  Future<Either<Failure, VideoEntity>> getVideoDetailsById(int id);
  Future<Either<Failure, VideoEntity>> getVideoDetailsByUrl(
      String url, String uuid);
}
