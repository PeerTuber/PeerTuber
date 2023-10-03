// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'package:json_annotation/json_annotation.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/common/data/models/models.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentModel {
  final int id;
  final String url;
  final String text;
  final int threadId;
  final int? inReplyToCommentId;
  final int videoId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final bool isDeleted;
  final int totalRepliesFromVideoAuthor;
  final int totalReplies;
  final AccountModel account;

  const CommentModel({
    required this.id,
    required this.url,
    required this.text,
    required this.threadId,
    required this.inReplyToCommentId,
    required this.videoId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.isDeleted,
    required this.totalRepliesFromVideoAuthor,
    required this.totalReplies,
    required this.account,
  });

  static const empty = CommentModel(
    id: 0,
    url: '',
    text: '',
    threadId: 0,
    inReplyToCommentId: null,
    videoId: 0,
    createdAt: null,
    updatedAt: null,
    deletedAt: null,
    isDeleted: false,
    totalRepliesFromVideoAuthor: 0,
    totalReplies: 0,
    account: AccountModel.empty,
  );

  //Make a toEntity method
  CommentModel copyWith({
    int? id,
    String? url,
    String? text,
    int? threadId,
    int? inReplyToCommentId,
    int? videoId,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    bool? isDeleted,
    int? totalRepliesFromVideoAuthor,
    int? totalReplies,
    AccountModel? account,
  }) {
    return CommentModel(
      id: id ?? this.id,
      url: url ?? this.url,
      text: text ?? this.text,
      threadId: threadId ?? this.threadId,
      inReplyToCommentId: inReplyToCommentId ?? this.inReplyToCommentId,
      videoId: videoId ?? this.videoId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      totalRepliesFromVideoAuthor:
          totalRepliesFromVideoAuthor ?? this.totalRepliesFromVideoAuthor,
      totalReplies: totalReplies ?? this.totalReplies,
      account: account ?? this.account,
    );
  }

  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      url: url,
      text: text,
      threadId: threadId,
      inReplyToCommentId: inReplyToCommentId,
      videoId: videoId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      isDeleted: isDeleted,
      totalRepliesFromVideoAuthor: totalRepliesFromVideoAuthor,
      totalReplies: totalReplies,
      account: account.toEntity(),
    );
  }

  factory CommentModel.fromEntity(CommentEntity entity) {
    return CommentModel(
      id: entity.id,
      url: entity.url,
      text: entity.text,
      threadId: entity.threadId,
      inReplyToCommentId: entity.inReplyToCommentId,
      videoId: entity.videoId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      isDeleted: entity.isDeleted,
      totalRepliesFromVideoAuthor: entity.totalRepliesFromVideoAuthor,
      totalReplies: entity.totalReplies,
      account: AccountModel.fromEntity(entity.account),
    );
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
