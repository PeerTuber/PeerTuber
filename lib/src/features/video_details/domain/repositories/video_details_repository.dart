import 'package:dartz/dartz.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
import 'package:flutter_peertuber/src/core/error/failures.dart';

abstract class VideoDetailsRepository {
  Future<Either<Failure, VideoEntity>> getVideoDetailsById(int id);
  Future<Either<Failure, VideoEntity>> getVideoDetailsByUrl(
      String url, String uuid);
}
