import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/common/data/datasources/search_videos_remote_data_source.dart';
import 'package:peertuber/src/features/common/data/models/search_data.dart';
import 'package:peertuber/src/features/common/domain/repositories/search_videos_repository.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchVideosRepository)
class SearchVideosRepositoryImpl implements SearchVideosRepository {
  final SearchVideosRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SearchVideosRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<VideoEntity>>> searchVideos(
      {required SearchDataEntity searchData, int? videoId}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteVideos = await remoteDataSource.searchVideos(
            searchData: SearchDataModel.fromEntity(searchData),
            videoId: videoId);
        return Right(remoteVideos.map((e) => e.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
