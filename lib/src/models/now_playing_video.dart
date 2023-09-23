// To parse this JSON data, do
//
//     final nowPlayingVideo = nowPlayingVideoFromJson(jsonString);
// Generated with https://app.quicktype.io/

/*
import 'dart:convert';

NowPlayingVideo nowPlayingVideoFromJson(String str) =>
    NowPlayingVideo.fromJson(json.decode(str));

String nowPlayingVideoToJson(NowPlayingVideo data) =>
    json.encode(data.toJson());

class NowPlayingVideo {
  int id;
  String uuid;
  String shortUuid;
  bool isLive;
  DateTime createdAt;
  DateTime publishedAt;
  DateTime updatedAt;
  DateTime originallyPublishedAt;
  Category category;
  Category licence;
  Language language;
  Category privacy;
  String description;
  int duration;
  bool isLocal;
  String name;
  String thumbnailPath;
  String previewPath;
  String embedPath;
  int views;
  int likes;
  int dislikes;
  bool nsfw;
  bool waitTranscoding;
  Category state;
  ScheduledUpdate scheduledUpdate;
  bool blacklisted;
  String blacklistedReason;
  Account account;
  Account channel;
  UserHistory userHistory;
  int viewers;
  String descriptionPath;
  String support;
  List<String> tags;
  bool commentsEnabled;
  bool downloadEnabled;
  DateTime inputFileUpdatedAt;
  List<String> trackerUrls;
  List<FileElement> files;
  List<StreamingPlaylist> streamingPlaylists;

  NowPlayingVideo({
    required this.id,
    required this.uuid,
    required this.shortUuid,
    required this.isLive,
    required this.createdAt,
    required this.publishedAt,
    required this.updatedAt,
    required this.originallyPublishedAt,
    required this.category,
    required this.licence,
    required this.language,
    required this.privacy,
    required this.description,
    required this.duration,
    required this.isLocal,
    required this.name,
    required this.thumbnailPath,
    required this.previewPath,
    required this.embedPath,
    required this.views,
    required this.likes,
    required this.dislikes,
    required this.nsfw,
    required this.waitTranscoding,
    required this.state,
    required this.scheduledUpdate,
    required this.blacklisted,
    required this.blacklistedReason,
    required this.account,
    required this.channel,
    required this.userHistory,
    required this.viewers,
    required this.descriptionPath,
    required this.support,
    required this.tags,
    required this.commentsEnabled,
    required this.downloadEnabled,
    required this.inputFileUpdatedAt,
    required this.trackerUrls,
    required this.files,
    required this.streamingPlaylists,
  });

  factory NowPlayingVideo.fromJson(Map<String, dynamic> json) =>
      NowPlayingVideo(
        id: json["id"],
        uuid: json["uuid"],
        shortUuid: json["shortUUID"],
        isLive: json["isLive"],
        createdAt: DateTime.parse(json["createdAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        originallyPublishedAt: DateTime.parse(json["originallyPublishedAt"]),
        category: Category.fromJson(json["category"]),
        licence: Category.fromJson(json["licence"]),
        language: Language.fromJson(json["language"]),
        privacy: Category.fromJson(json["privacy"]),
        description: json["description"],
        duration: json["duration"],
        isLocal: json["isLocal"],
        name: json["name"],
        thumbnailPath: json["thumbnailPath"],
        previewPath: json["previewPath"],
        embedPath: json["embedPath"],
        views: json["views"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        nsfw: json["nsfw"],
        waitTranscoding: json["waitTranscoding"],
        state: Category.fromJson(json["state"]),
        scheduledUpdate: ScheduledUpdate.fromJson(json["scheduledUpdate"]),
        blacklisted: json["blacklisted"],
        blacklistedReason: json["blacklistedReason"],
        account: Account.fromJson(json["account"]),
        channel: Account.fromJson(json["channel"]),
        userHistory: UserHistory.fromJson(json["userHistory"]),
        viewers: json["viewers"],
        descriptionPath: json["descriptionPath"],
        support: json["support"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        commentsEnabled: json["commentsEnabled"],
        downloadEnabled: json["downloadEnabled"],
        inputFileUpdatedAt: DateTime.parse(json["inputFileUpdatedAt"]),
        trackerUrls: List<String>.from(json["trackerUrls"].map((x) => x)),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        streamingPlaylists: List<StreamingPlaylist>.from(
            json["streamingPlaylists"]
                .map((x) => StreamingPlaylist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "shortUUID": shortUuid,
        "isLive": isLive,
        "createdAt": createdAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "originallyPublishedAt": originallyPublishedAt.toIso8601String(),
        "category": category.toJson(),
        "licence": licence.toJson(),
        "language": language.toJson(),
        "privacy": privacy.toJson(),
        "description": description,
        "duration": duration,
        "isLocal": isLocal,
        "name": name,
        "thumbnailPath": thumbnailPath,
        "previewPath": previewPath,
        "embedPath": embedPath,
        "views": views,
        "likes": likes,
        "dislikes": dislikes,
        "nsfw": nsfw,
        "waitTranscoding": waitTranscoding,
        "state": state.toJson(),
        "scheduledUpdate": scheduledUpdate.toJson(),
        "blacklisted": blacklisted,
        "blacklistedReason": blacklistedReason,
        "account": account.toJson(),
        "channel": channel.toJson(),
        "userHistory": userHistory.toJson(),
        "viewers": viewers,
        "descriptionPath": descriptionPath,
        "support": support,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "commentsEnabled": commentsEnabled,
        "downloadEnabled": downloadEnabled,
        "inputFileUpdatedAt": inputFileUpdatedAt.toIso8601String(),
        "trackerUrls": List<dynamic>.from(trackerUrls.map((x) => x)),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "streamingPlaylists":
            List<dynamic>.from(streamingPlaylists.map((x) => x.toJson())),
      };
}

class Account {
  int id;
  String name;
  String displayName;
  String url;
  String host;
  List<Avatar> avatars;
  bool hostRedundancyAllowed;
  int followingCount;
  int followersCount;
  DateTime createdAt;
  DateTime updatedAt;
  int? userId;
  String description;
  String? support;
  bool? isLocal;
  List<Avatar>? banners;
  OwnerAccount? ownerAccount;

  Account({
    required this.id,
    required this.name,
    required this.displayName,
    required this.url,
    required this.host,
    required this.avatars,
    required this.hostRedundancyAllowed,
    required this.followingCount,
    required this.followersCount,
    required this.createdAt,
    required this.updatedAt,
    this.userId,
    required this.description,
    this.support,
    this.isLocal,
    this.banners,
    this.ownerAccount,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        displayName: json["displayName"],
        url: json["url"],
        host: json["host"],
        avatars:
            List<Avatar>.from(json["avatars"].map((x) => Avatar.fromJson(x))),
        hostRedundancyAllowed: json["hostRedundancyAllowed"],
        followingCount: json["followingCount"],
        followersCount: json["followersCount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        description: json["description"],
        support: json["support"],
        isLocal: json["isLocal"],
        banners: json["banners"] == null
            ? []
            : List<Avatar>.from(
                json["banners"]!.map((x) => Avatar.fromJson(x))),
        ownerAccount: json["ownerAccount"] == null
            ? null
            : OwnerAccount.fromJson(json["ownerAccount"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "displayName": displayName,
        "url": url,
        "host": host,
        "avatars": List<dynamic>.from(avatars.map((x) => x.toJson())),
        "hostRedundancyAllowed": hostRedundancyAllowed,
        "followingCount": followingCount,
        "followersCount": followersCount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
        "description": description,
        "support": support,
        "isLocal": isLocal,
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "ownerAccount": ownerAccount?.toJson(),
      };
}

class Avatar {
  String path;
  int width;
  DateTime createdAt;
  DateTime updatedAt;

  Avatar({
    required this.path,
    required this.width,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        path: json["path"],
        width: json["width"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "width": width,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class OwnerAccount {
  int id;
  String uuid;

  OwnerAccount({
    required this.id,
    required this.uuid,
  });

  factory OwnerAccount.fromJson(Map<String, dynamic> json) => OwnerAccount(
        id: json["id"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
      };
}

class Category {
  int id;
  String label;

  Category({
    required this.id,
    required this.label,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class FileElement {
  int id;
  String magnetUri;
  Category resolution;
  int size;
  String torrentUrl;
  String torrentDownloadUrl;
  String fileUrl;
  String fileDownloadUrl;
  int fps;
  String metadataUrl;

  FileElement({
    required this.id,
    required this.magnetUri,
    required this.resolution,
    required this.size,
    required this.torrentUrl,
    required this.torrentDownloadUrl,
    required this.fileUrl,
    required this.fileDownloadUrl,
    required this.fps,
    required this.metadataUrl,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        magnetUri: json["magnetUri"],
        resolution: Category.fromJson(json["resolution"]),
        size: json["size"],
        torrentUrl: json["torrentUrl"],
        torrentDownloadUrl: json["torrentDownloadUrl"],
        fileUrl: json["fileUrl"],
        fileDownloadUrl: json["fileDownloadUrl"],
        fps: json["fps"],
        metadataUrl: json["metadataUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "magnetUri": magnetUri,
        "resolution": resolution.toJson(),
        "size": size,
        "torrentUrl": torrentUrl,
        "torrentDownloadUrl": torrentDownloadUrl,
        "fileUrl": fileUrl,
        "fileDownloadUrl": fileDownloadUrl,
        "fps": fps,
        "metadataUrl": metadataUrl,
      };
}

class Language {
  String id;
  String label;

  Language({
    required this.id,
    required this.label,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class ScheduledUpdate {
  int privacy;
  DateTime updateAt;

  ScheduledUpdate({
    required this.privacy,
    required this.updateAt,
  });

  factory ScheduledUpdate.fromJson(Map<String, dynamic> json) =>
      ScheduledUpdate(
        privacy: json["privacy"],
        updateAt: DateTime.parse(json["updateAt"]),
      );

  Map<String, dynamic> toJson() => {
        "privacy": privacy,
        "updateAt":
            "${updateAt.year.toString().padLeft(4, '0')}-${updateAt.month.toString().padLeft(2, '0')}-${updateAt.day.toString().padLeft(2, '0')}",
      };
}

class StreamingPlaylist {
  int id;
  int type;
  String playlistUrl;
  String segmentsSha256Url;
  List<FileElement> files;
  List<Redundancy> redundancies;

  StreamingPlaylist({
    required this.id,
    required this.type,
    required this.playlistUrl,
    required this.segmentsSha256Url,
    required this.files,
    required this.redundancies,
  });

  factory StreamingPlaylist.fromJson(Map<String, dynamic> json) =>
      StreamingPlaylist(
        id: json["id"],
        type: json["type"],
        playlistUrl: json["playlistUrl"],
        segmentsSha256Url: json["segmentsSha256Url"],
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        redundancies: List<Redundancy>.from(
            json["redundancies"].map((x) => Redundancy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "playlistUrl": playlistUrl,
        "segmentsSha256Url": segmentsSha256Url,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "redundancies": List<dynamic>.from(redundancies.map((x) => x.toJson())),
      };
}

class Redundancy {
  String baseUrl;

  Redundancy({
    required this.baseUrl,
  });

  factory Redundancy.fromJson(Map<String, dynamic> json) => Redundancy(
        baseUrl: json["baseUrl"],
      );

  Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl,
      };
}

class UserHistory {
  int currentTime;

  UserHistory({
    required this.currentTime,
  });

  factory UserHistory.fromJson(Map<String, dynamic> json) => UserHistory(
        currentTime: json["currentTime"],
      );

  Map<String, dynamic> toJson() => {
        "currentTime": currentTime,
      };
}
*/