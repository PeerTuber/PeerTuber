import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/comments/data/datasources/comment_remote_data_source.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';
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

  @override
  Future<Either<Failure, List<CommentEntity>>> getCommentsByUrl({
    required String videoUrl,
    required int videoId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComments = await remoteDataSource.getCommentsByUrl(
            videoUrl: videoUrl, videoId: videoId);
        return Right(remoteComments.map((e) => e.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<CommentReplyEntity>>> getReplies({
    required int videoId,
    required int threadId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComments = await remoteDataSource.getReplies(
            videoId: videoId, threadId: threadId);
        return Right(remoteComments.map((e) => e.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<CommentReplyEntity>>> getRepliesByUrl({
    required String videoUrl,
    required int videoId,
    required int threadId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComments = await remoteDataSource.getRepliesByUrl(
            videoUrl: videoUrl, videoId: videoId, threadId: threadId);
        return Right(remoteComments.map((e) => e.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
