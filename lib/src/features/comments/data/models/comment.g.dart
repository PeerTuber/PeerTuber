// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as int,
      url: json['url'] as String,
      text: json['text'] as String,
      threadId: json['threadId'] as int,
      inReplyToCommentId: json['inReplyToCommentId'] as int?,
      videoId: json['videoId'] as int,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'],
      isDeleted: json['isDeleted'] as bool,
      totalRepliesFromVideoAuthor: json['totalRepliesFromVideoAuthor'] as int,
      totalReplies: json['totalReplies'] as int,
      account: AccountModel.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'text': instance.text,
      'threadId': instance.threadId,
      'inReplyToCommentId': instance.inReplyToCommentId,
      'videoId': instance.videoId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt,
      'isDeleted': instance.isDeleted,
      'totalRepliesFromVideoAuthor': instance.totalRepliesFromVideoAuthor,
      'totalReplies': instance.totalReplies,
      'account': instance.account,
    };
