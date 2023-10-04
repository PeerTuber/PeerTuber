import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';

class CommentReplyEntity extends Equatable {
  final CommentEntity comment;
  final List<CommentReplyEntity> children;

  const CommentReplyEntity({
    required this.comment,
    required this.children,
  });

  static const empty = CommentReplyEntity(
    comment: CommentEntity.empty,
    children: <CommentReplyEntity>[],
  );

  @override
  List<Object?> get props => [
        comment,
        children,
      ];
}
