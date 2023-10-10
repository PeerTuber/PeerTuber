// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/data/models/models.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';

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

class VideoModel extends Equatable {
  final int id;
  final String? uuid;
  final String? shortUuid;
  final String? url;
  final String? remoteHost;
  final String name;
  final CategoryModel category;
  final LanguageModel licence;
  final LanguageModel language;
  final CategoryModel privacy;
  final bool nsfw;
  final String? truncatedDescription;
  final String? description;
  final bool? isLocal;
  final int? duration;
  final int? views;
  final int? viewers;
  final int? likes;
  final int? dislikes;
  final String? thumbnailPath;
  final String? thumbnailUrl;
  final String? previewPath;
  final String? embedPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final DateTime? originallyPublishedAt;
  final bool isLive;
  final AccountModel? account;
  final ChannelModel? channel;
  final bool? blacklisted;
  final dynamic blacklistedReason;
  final List<StreamingPlaylistModel>? streamingPlaylists;
  final List<dynamic>? files;
  final dynamic support;
  final String? descriptionPath;
  final List<String>? tags;
  final bool? commentsEnabled;
  final bool? downloadEnabled;
  final bool? waitTranscoding;
  final CategoryModel? state;
  final List<String>? trackerUrls;

  const VideoModel({
    required this.id,
    required this.uuid,
    required this.shortUuid,
    this.url,
    this.remoteHost,
    required this.name,
    required this.category,
    required this.licence,
    required this.language,
    required this.privacy,
    required this.nsfw,
    required this.truncatedDescription,
    required this.description,
    this.isLocal,
    required this.duration,
    required this.views,
    required this.viewers,
    required this.likes,
    required this.dislikes,
    required this.thumbnailPath,
    this.thumbnailUrl,
    required this.previewPath,
    required this.embedPath,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.originallyPublishedAt,
    required this.isLive,
    required this.account,
    required this.channel,
    this.blacklisted,
    this.blacklistedReason,
    this.streamingPlaylists,
    this.files,
    this.support,
    this.descriptionPath,
    this.tags,
    this.commentsEnabled,
    this.downloadEnabled,
    this.waitTranscoding,
    this.state,
    this.trackerUrls,
  });

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

  VideoEntity toEntity() {
    return VideoEntity(
      id: id,
      uuid: uuid,
      shortUuid: shortUuid,
      url: url,
      remoteHost: remoteHost,
      name: name,
      category: category.toEntity(),
      licence: licence.toEntity(),
      language: language.toEntity(),
      privacy: privacy.toEntity(),
      nsfw: nsfw,
      truncatedDescription: truncatedDescription,
      description: description,
      isLocal: isLocal,
      duration: duration,
      views: views,
      viewers: viewers,
      likes: likes,
      dislikes: dislikes,
      thumbnailPath: thumbnailPath,
      thumbnailUrl: thumbnailUrl,
      previewPath: previewPath,
      embedPath: embedPath,
      createdAt: createdAt,
      updatedAt: updatedAt,
      publishedAt: publishedAt,
      originallyPublishedAt: originallyPublishedAt,
      isLive: isLive,
      account: account!.toEntity(),
      channel: channel!.toEntity(),
      blacklisted: blacklisted,
      blacklistedReason: blacklistedReason,
      streamingPlaylists:
          streamingPlaylists?.map((e) => e.toEntity()).toList(growable: false),
      files: files,
      support: support,
      descriptionPath: descriptionPath,
      tags: tags,
      commentsEnabled: commentsEnabled,
      downloadEnabled: downloadEnabled,
      waitTranscoding: waitTranscoding,
      state: state?.toEntity(),
      trackerUrls: trackerUrls,
    );
  }

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
        isLocal: null,
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
}

class CategoryModel extends Equatable {
  final int? id;
  final String label;

  const CategoryModel({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      label: label,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity category) {
    return CategoryModel(
      id: category.id,
      label: category.label,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class LanguageModel extends Equatable {
  final dynamic id;
  final String label;

  const LanguageModel({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];

  LanguageEntity toEntity() {
    return LanguageEntity(
      id: id,
      label: label,
    );
  }

  factory LanguageModel.fromEntity(LanguageEntity language) {
    return LanguageModel(
      id: language.id,
      label: language.label,
    );
  }

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class StreamingPlaylistModel extends Equatable {
  final int id;
  final int type;
  final String playlistUrl;
  final String segmentsSha256Url;
  final List<dynamic> redundancies;
  final List<FileElementModel> files;

  const StreamingPlaylistModel({
    required this.id,
    required this.type,
    required this.playlistUrl,
    required this.segmentsSha256Url,
    required this.redundancies,
    required this.files,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        playlistUrl,
        segmentsSha256Url,
        redundancies,
        files,
      ];

  factory StreamingPlaylistModel.fromJson(Map<String, dynamic> json) =>
      StreamingPlaylistModel(
        id: json["id"],
        type: json["type"],
        playlistUrl: json["playlistUrl"],
        segmentsSha256Url: json["segmentsSha256Url"],
        redundancies: List<dynamic>.from(json["redundancies"].map((x) => x)),
        files: List<FileElementModel>.from(
            json["files"].map((x) => FileElementModel.fromJson(x))),
      );

  StreamingPlaylistEntity toEntity() {
    return StreamingPlaylistEntity(
      id: id,
      type: type,
      playlistUrl: playlistUrl,
      segmentsSha256Url: segmentsSha256Url,
      redundancies: redundancies,
      files: files.map((file) => file.toEntity()).toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "playlistUrl": playlistUrl,
        "segmentsSha256Url": segmentsSha256Url,
        "redundancies": List<dynamic>.from(redundancies.map((x) => x)),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class FileElementModel extends Equatable {
  final int? id;
  final CategoryModel resolution;
  final String magnetUri;
  final int size;
  final int fps;
  final String torrentUrl;
  final String torrentDownloadUrl;
  final String fileUrl;
  final String fileDownloadUrl;
  final String metadataUrl;

  const FileElementModel({
    required this.id,
    required this.resolution,
    required this.magnetUri,
    required this.size,
    required this.fps,
    required this.torrentUrl,
    required this.torrentDownloadUrl,
    required this.fileUrl,
    required this.fileDownloadUrl,
    required this.metadataUrl,
  });

  @override
  List<Object?> get props => [
        id,
        resolution,
        magnetUri,
        size,
        fps,
        torrentUrl,
        torrentDownloadUrl,
        fileUrl,
        fileDownloadUrl,
        metadataUrl,
      ];

  FileElementEntity toEntity() {
    return FileElementEntity(
      id: id,
      resolution: resolution.toEntity(),
      magnetUri: magnetUri,
      size: size,
      fps: fps,
      torrentUrl: torrentUrl,
      torrentDownloadUrl: torrentDownloadUrl,
      fileUrl: fileUrl,
      fileDownloadUrl: fileDownloadUrl,
      metadataUrl: metadataUrl,
    );
  }

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
        "resolution": resolution.toJson(),
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
