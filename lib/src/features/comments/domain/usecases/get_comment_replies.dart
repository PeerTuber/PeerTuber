import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';
import 'package:peertuber/src/features/comments/domain/repositories/comment_repository.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCommentRepliesUseCase
    implements
        UseCase<Future<Either<Failure, List<CommentReplyEntity>>>,
            CommentParams> {
  final CommentRepository repository;

  GetCommentRepliesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CommentReplyEntity>>> call(
      CommentParams params) async {
    return await repository.getReplies(
        videoId: params.videoId, threadId: params.threadId!);
  }
}
