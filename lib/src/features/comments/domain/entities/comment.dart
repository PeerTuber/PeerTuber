import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

class CommentEntity extends Equatable {
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
  final AccountEntity? account;

  const CommentEntity({
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
    this.account,
  });

  static const empty = CommentEntity(
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
    account: AccountEntity.empty,
  );

  @override
  List<Object?> get props => [
        id,
        url,
        text,
        threadId,
        inReplyToCommentId,
        videoId,
        createdAt,
        updatedAt,
        deletedAt,
        isDeleted,
        totalRepliesFromVideoAuthor,
        totalReplies,
        account,
      ];
}
