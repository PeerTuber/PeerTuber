import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

class VideoEntity extends Equatable {
  final int id;
  final String? uuid;
  final String? shortUuid;
  final String url;
  final String? remoteHost;
  final String name;
  final CategoryEntity category;
  final LanguageEntity licence;
  final LanguageEntity language;
  final CategoryEntity privacy;
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
  final AccountEntity account;
  final ChannelEntity channel;
  final bool? blacklisted;
  final dynamic blacklistedReason;
  final List<StreamingPlaylistEntity>? streamingPlaylists;
  final List<dynamic>? files;
  final dynamic support;
  final String? descriptionPath;
  final List<String>? tags;
  final bool? commentsEnabled;
  final bool? downloadEnabled;
  final bool? waitTranscoding;
  final CategoryEntity? state;
  final List<String>? trackerUrls;

  const VideoEntity({
    required this.id,
    required this.uuid,
    required this.shortUuid,
    required this.url,
    required this.remoteHost,
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
}

class CategoryEntity extends Equatable {
  final int? id;
  final String label;

  const CategoryEntity({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];
}

class LanguageEntity extends Equatable {
  final dynamic id;
  final String label;

  const LanguageEntity({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];
}

class StreamingPlaylistEntity extends Equatable {
  final int id;
  final int type;
  final String playlistUrl;
  final String segmentsSha256Url;
  final List<dynamic> redundancies;
  final List<FileElementEntity> files;

  const StreamingPlaylistEntity({
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
}

class FileElementEntity extends Equatable {
  final int id;
  final CategoryEntity resolution;
  final String magnetUri;
  final int size;
  final int fps;
  final String torrentUrl;
  final String torrentDownloadUrl;
  final String fileUrl;
  final String fileDownloadUrl;
  final String metadataUrl;

  const FileElementEntity({
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
}
