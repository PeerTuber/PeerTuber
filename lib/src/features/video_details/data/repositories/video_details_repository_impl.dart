import 'package:dartz/dartz.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
import 'package:flutter_peertuber/src/core/error/exceptions.dart';
import 'package:flutter_peertuber/src/core/error/failures.dart';
import 'package:flutter_peertuber/src/core/network/network_info.dart';
import 'package:flutter_peertuber/src/features/video_details/data/datasources/video_details_remote_data_source.dart';
import 'package:flutter_peertuber/src/features/video_details/domain/repositories/video_details_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VideoDetailsRepository)
class VideoDetailsRepositoryImpl implements VideoDetailsRepository {
  final VideoDetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  VideoDetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, VideoEntity>> getVideoDetailsById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteVideos = await remoteDataSource.getVideoDetailsById(id);
        return Right(remoteVideos);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, VideoEntity>> getVideoDetailsByUrl(
      String url, String uuid) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteVideos =
            await remoteDataSource.getVideoDetailsByUrl(url, uuid);
        return Right(remoteVideos);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
