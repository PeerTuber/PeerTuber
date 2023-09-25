import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/failures.dart';

abstract class SearchVideosRepository {
  Future<Either<Failure, List<VideoEntity>>> searchVideos(
      SearchDataEntity searchData);
}
