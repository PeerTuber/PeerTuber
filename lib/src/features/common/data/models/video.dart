// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'dart:convert';

import 'package:flutter_peertuber/src/features/common/data/models/models.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';

VideoModel videoFromJson(String str) => VideoModel.fromJson(json.decode(str));

String formatTimeDuration(int seconds) {
  var duration = '';
  var value = '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(2, '0');
  var split = value.split(':');
  if (split[0] == '0') {
    duration = '${split[1]}:${split[2]}';
  }
  return duration;
}

class VideoModel extends VideoEntity {
  const VideoModel(
      {required super.id,
      required super.uuid,
      required super.shortUuid,
      required super.url,
      super.remoteHost,
      required super.name,
      required super.category,
      required super.licence,
      required super.language,
      required super.privacy,
      required super.nsfw,
      required super.truncatedDescription,
      required super.description,
      super.isLocal,
      required super.duration,
      required super.views,
      required super.viewers,
      required super.likes,
      required super.dislikes,
      required super.thumbnailPath,
      super.thumbnailUrl,
      required super.previewPath,
      required super.embedPath,
      required super.createdAt,
      required super.updatedAt,
      required super.publishedAt,
      required super.originallyPublishedAt,
      required super.isLive,
      required super.account,
      required super.channel,
      super.blacklisted,
      super.blacklistedReason,
      super.streamingPlaylists,
      super.files,
      super.support,
      super.descriptionPath,
      super.tags,
      super.commentsEnabled,
      super.downloadEnabled,
      super.waitTranscoding,
      super.state,
      super.trackerUrls})
      : super();

  factory VideoModel.withRemoteHost(VideoModel video, String remoteHost) =>
      VideoModel(
        id: video.id,
        uuid: video.uuid,
        shortUuid: video.shortUuid,
        url: video.url,
        remoteHost: remoteHost,
        name: video.name,
        category: video.category,
        licence: video.licence,
        language: video.language,
        privacy: video.privacy,
        nsfw: video.nsfw,
        truncatedDescription: video.truncatedDescription,
        description: video.description,
        isLocal: video.isLocal,
        duration: video.duration,
        views: video.views,
        viewers: video.viewers,
        likes: video.likes,
        dislikes: video.dislikes,
        thumbnailPath: video.thumbnailPath,
        thumbnailUrl: video.thumbnailUrl,
        previewPath: video.previewPath,
        embedPath: video.embedPath,
        createdAt: video.createdAt,
        updatedAt: video.updatedAt,
        publishedAt: video.publishedAt,
        originallyPublishedAt: video.originallyPublishedAt,
        isLive: video.isLive,
        account: video.account,
        channel: video.channel,
        blacklisted: video.blacklisted,
        blacklistedReason: video.blacklistedReason,
        streamingPlaylists: video.streamingPlaylists,
        files: video.files,
        support: video.support,
        descriptionPath: video.descriptionPath,
        tags: video.tags,
        commentsEnabled: video.commentsEnabled,
        downloadEnabled: video.downloadEnabled,
        waitTranscoding: video.waitTranscoding,
        state: video.state,
        trackerUrls: video.trackerUrls,
      );

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        uuid: json["uuid"],
        shortUuid: json["shortUUID"],
        url: json["url"],
        name: json["name"],
        category: CategoryModel.fromJson(json["category"]),
        licence: LanguageModel.fromJson(json["licence"]),
        language: LanguageModel.fromJson(json["language"]),
        privacy: CategoryModel.fromJson(json["privacy"]),
        nsfw: json["nsfw"],
        truncatedDescription: json["truncatedDescription"],
        description: json["description"],
        isLocal: json["isLocal"],
        duration: json["duration"],
        views: json["views"],
        viewers: json["viewers"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        thumbnailPath: json["thumbnailPath"],
        thumbnailUrl: json["thumbnailUrl"],
        previewPath: json["previewPath"],
        embedPath: json["embedPath"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        originallyPublishedAt: json["originallyPublishedAt"] == null
            ? null
            : DateTime.parse(json["originallyPublishedAt"]),
        isLive: json["isLive"],
        account: AccountModel.fromJson(json["account"]),
        channel: ChannelModel.fromJson(json["channel"]),
        blacklisted: json["blacklisted"],
        blacklistedReason: json["blacklistedReason"],
        streamingPlaylists: json["streamingPlaylists"] == null
            ? []
            : List<StreamingPlaylistModel>.from(json["streamingPlaylists"]
                .map((x) => StreamingPlaylistModel.fromJson(x))),
        files: json["files"] == null
            ? []
            : List<dynamic>.from(json["files"].map((x) => x)),
        support: json["support"],
        descriptionPath: json["descriptionPath"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        commentsEnabled: json["commentsEnabled"],
        downloadEnabled: json["downloadEnabled"],
        waitTranscoding: json["waitTranscoding"],
        state: json["state"] == null
            ? null
            : CategoryModel.fromJson(json["state"]),
        trackerUrls: json["trackerUrls"] == null
            ? null
            : List<String>.from(json["trackerUrls"].map((x) => x)),
      );

  @override
  List<Object?> get props => [
        id,
        uuid,
        shortUuid,
        url,
        remoteHost,
        name,
        category,
        licence,
        language,
        privacy,
        nsfw,
        truncatedDescription,
        description,
        isLocal,
        duration,
        views,
        viewers,
        likes,
        dislikes,
        thumbnailPath,
        thumbnailUrl,
        previewPath,
        embedPath,
        createdAt,
        updatedAt,
        publishedAt,
        originallyPublishedAt,
        isLive,
        account,
        channel,
        blacklisted,
        blacklistedReason,
        streamingPlaylists,
        files,
        support,
        descriptionPath,
        tags,
        commentsEnabled,
        downloadEnabled,
        waitTranscoding,
        state,
        trackerUrls,
      ];
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.id, required super.label}) : super();

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class StreamingPlaylistModel extends StreamingPlaylistEntity {
  const StreamingPlaylistModel(
      {required super.id,
      required super.type,
      required super.playlistUrl,
      required super.segmentsSha256Url,
      required super.redundancies,
      required super.files})
      : super();

  factory StreamingPlaylistModel.fromJson(Map<String, dynamic> json) =>
      StreamingPlaylistModel(
        id: json["id"],
        type: json["type"],
        playlistUrl: json["playlistUrl"],
        segmentsSha256Url: json["segmentsSha256Url"],
        redundancies: List<dynamic>.from(json["redundancies"].map((x) => x)),
        files: List<FileElementEntity>.from(
            json["files"].map((x) => FileElementModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "playlistUrl": playlistUrl,
        "segmentsSha256Url": segmentsSha256Url,
        "redundancies": List<dynamic>.from(redundancies.map((x) => x)),
        "files": List<dynamic>.from(
            files.map((x) => (x as FileElementModel).toJson())),
      };
}

class FileElementModel extends FileElementEntity {
  const FileElementModel(
      {required super.id,
      required super.resolution,
      required super.magnetUri,
      required super.size,
      required super.fps,
      required super.torrentUrl,
      required super.torrentDownloadUrl,
      required super.fileUrl,
      required super.fileDownloadUrl,
      required super.metadataUrl})
      : super();

  factory FileElementModel.fromJson(Map<String, dynamic> json) =>
      FileElementModel(
        id: json["id"],
        resolution: CategoryModel.fromJson(json["resolution"]),
        magnetUri: json["magnetUri"],
        size: json["size"],
        fps: json["fps"],
        torrentUrl: json["torrentUrl"],
        torrentDownloadUrl: json["torrentDownloadUrl"],
        fileUrl: json["fileUrl"],
        fileDownloadUrl: json["fileDownloadUrl"],
        metadataUrl: json["metadataUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resolution": (resolution as CategoryModel).toJson(),
        "magnetUri": magnetUri,
        "size": size,
        "fps": fps,
        "torrentUrl": torrentUrl,
        "torrentDownloadUrl": torrentDownloadUrl,
        "fileUrl": fileUrl,
        "fileDownloadUrl": fileDownloadUrl,
        "metadataUrl": metadataUrl,
      };
}
