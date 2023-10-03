import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/comments/data/datasources/comment_remote_data_source.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/repositories/comment_repository.dart';
import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CommentRepository)
class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CommentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(
      {required int videoId}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComments =
            await remoteDataSource.getComments(videoId: videoId);
        return Right(remoteComments.map((e) => e.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
