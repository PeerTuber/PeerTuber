// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentReplyModel _$CommentReplyModelFromJson(Map<String, dynamic> json) =>
    CommentReplyModel(
      comment: CommentModel.fromJson(json['comment'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>)
          .map((e) => CommentReplyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentReplyModelToJson(CommentReplyModel instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'children': instance.children,
    };
