import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getComments({
    required int videoId,
  });
  Future<Either<Failure, List<CommentEntity>>> getCommentsByUrl({
    required String videoUrl,
    required int videoId,
  });
  Future<Either<Failure, List<CommentReplyEntity>>> getReplies({
    required int videoId,
    required int threadId,
  });
  Future<Either<Failure, List<CommentReplyEntity>>> getRepliesByUrl({
    required String videoUrl,
    required int videoId,
    required int threadId,
  });
}
