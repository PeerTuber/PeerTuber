import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/core/network/network_info.dart';
import 'package:peertuber/src/features/home/data/datasources/home_videos_remote_data_source.dart';
import 'package:peertuber/src/features/home/domain/repositories/home_videos_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeVideosRespository)
class HomeVideosRespositoryImpl implements HomeVideosRespository {
  final HomeVideosRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeVideosRespositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<VideoEntity>>> getHomeVideos() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteVideos = await remoteDataSource.getHomeVideos();
        return Right(remoteVideos.map((e) => e.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
