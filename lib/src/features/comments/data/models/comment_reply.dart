import 'package:json_annotation/json_annotation.dart';
import 'package:peertuber/src/features/comments/data/models/comment.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';

part 'comment_reply.g.dart';

@JsonSerializable()
class CommentReplyModel {
  final CommentModel comment;
  final List<CommentReplyModel> children;

  const CommentReplyModel({
    required this.comment,
    required this.children,
  });

  static const empty = CommentReplyModel(
    comment: CommentModel.empty,
    children: <CommentReplyModel>[],
  );

  factory CommentReplyModel.fromEntity(CommentReplyEntity entity) =>
      CommentReplyModel(
        comment: CommentModel.fromEntity(entity.comment),
        children: entity.children
            .map((e) => CommentReplyModel.fromEntity(e))
            .toList(),
      );

  CommentReplyEntity toEntity() => CommentReplyEntity(
        comment: comment.toEntity(),
        children: children.map((e) => e.toEntity()).toList(),
      );

  factory CommentReplyModel.fromJson(Map<String, dynamic> json) =>
      _$CommentReplyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentReplyModelToJson(this);
}
