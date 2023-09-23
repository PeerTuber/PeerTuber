// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'dart:convert';

import 'package:flutter_peertuber/src/features/common/data/models/user.dart';

CommentThread commentFromJson(String str) =>
    CommentThread.fromJson(json.decode(str));

class CommentThread {
  int id;
  String url;
  String text;
  int threadId;
  int inReplyToCommentId;
  int videoId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  bool isDeleted;
  int totalRepliesFromVideoAuthor;
  int totalReplies;
  AccountModel account;

  CommentThread({
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

  factory CommentThread.fromJson(Map<String, dynamic> json) => CommentThread(
        id: json["id"],
        url: json["url"],
        text: json["text"],
        threadId: json["threadId"],
        inReplyToCommentId: json["inReplyToCommentId"],
        videoId: json["videoId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        isDeleted: json["isDeleted"],
        totalRepliesFromVideoAuthor: json["totalRepliesFromVideoAuthor"] ?? 0,
        totalReplies: json["totalReplies"] ?? 0,
        account: AccountModel.fromJson(json["account"]),
      );
}
