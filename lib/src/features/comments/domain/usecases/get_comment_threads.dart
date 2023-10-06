import 'package:dartz/dartz.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/repositories/comment_repository.dart';
import 'package:peertuber/src/core/error/failures.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCommentThreadUseCase
    implements
        UseCase<Future<Either<Failure, List<CommentEntity>>>, CommentParams> {
  final CommentRepository repository;

  GetCommentThreadUseCase(this.repository);

  @override
  Future<Either<Failure, List<CommentEntity>>> call(
      CommentParams params) async {
    if (params.videoUrl != null) {
      return await repository.getCommentsByUrl(
          videoUrl: params.videoUrl!, videoId: params.videoId);
    } else {
      return await repository.getComments(videoId: params.videoId);
    }
  }
}
