// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final AccountEntity account;
  final bool autoPlayNextVideo;
  final bool autoPlayNextVideoPlaylist;
  final bool autoPlayVideo;
  final bool blocked;
  final String blockedReason;
  final String createdAt;
  final String email;
  final bool emailVerified;
  final int id;
  final String pluginAuth;
  final DateTime lastLoginDate;
  final bool noInstanceConfigWarningModal;
  final bool noAccountSetupWarningModal;
  final bool noWelcomeModal;
  final String nsfwPolicy;
  final RoleEntity role;
  final String theme;
  final String username;
  final List<VideoChannelEntity> videoChannels;
  final int videoQuota;
  final int videoQuotaDaily;
  final bool p2PEnabled;

  const UserEntity({
    required this.account,
    required this.autoPlayNextVideo,
    required this.autoPlayNextVideoPlaylist,
    required this.autoPlayVideo,
    required this.blocked,
    required this.blockedReason,
    required this.createdAt,
    required this.email,
    required this.emailVerified,
    required this.id,
    required this.pluginAuth,
    required this.lastLoginDate,
    required this.noInstanceConfigWarningModal,
    required this.noAccountSetupWarningModal,
    required this.noWelcomeModal,
    required this.nsfwPolicy,
    required this.role,
    required this.theme,
    required this.username,
    required this.videoChannels,
    required this.videoQuota,
    required this.videoQuotaDaily,
    required this.p2PEnabled,
  });

  @override
  List<Object?> get props => [
        account,
        autoPlayNextVideo,
        autoPlayNextVideoPlaylist,
        autoPlayNextVideo,
        blocked,
        blockedReason,
        createdAt,
        email,
        emailVerified,
        id,
        pluginAuth,
        lastLoginDate,
        noInstanceConfigWarningModal,
        noAccountSetupWarningModal,
        noWelcomeModal,
        nsfwPolicy,
        role,
        theme,
        username,
        videoChannels,
        videoQuota,
        videoQuotaDaily,
        p2PEnabled,
      ];
}

class AccountEntity extends Equatable {
  final String url;
  final String name;
  final String host;
  final List<AvatarEntity> avatars;
  final AvatarEntity? avatar;
  final int id;
  final bool? hostRedundancyAllowed;
  final int? followingCount;
  final int? followersCount;
  final DateTime? createdAt;
  final List<dynamic>? banners;
  final String displayName;
  final String? description;
  final DateTime? updatedAt;
  final int? userId;

  const AccountEntity({
    required this.url,
    required this.name,
    required this.host,
    required this.avatars,
    required this.avatar,
    required this.id,
    this.hostRedundancyAllowed,
    this.followingCount,
    this.followersCount,
    this.createdAt,
    this.banners,
    required this.displayName,
    this.description,
    this.updatedAt,
    this.userId,
  });

  @override
  List<Object?> get props => [
        url,
        name,
        host,
        avatars,
        avatar,
        id,
        hostRedundancyAllowed,
        followingCount,
        followersCount,
        createdAt,
        banners,
        displayName,
        description,
        updatedAt,
        userId,
      ];
}

class AvatarEntity extends Equatable {
  final int? width;
  final String path;
  final String? url;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AvatarEntity({
    this.width,
    required this.path,
    this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        width,
        path,
        url,
        createdAt,
        updatedAt,
      ];
}

class RoleEntity extends Equatable {
  final int id;
  final String label;

  const RoleEntity({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];
}

class VideoChannelEntity extends Equatable {
  final int id;
  final String url;
  final String name;
  final String host;
  final bool hostRedundancyAllowed;
  final int followingCount;
  final int followersCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String displayName;
  final String description;
  final String support;
  final bool isLocal;
  final List<BannerEntity> banners;
  final OwnerAccountEntity ownerAccount;

  const VideoChannelEntity({
    required this.id,
    required this.url,
    required this.name,
    required this.host,
    required this.hostRedundancyAllowed,
    required this.followingCount,
    required this.followersCount,
    required this.createdAt,
    required this.updatedAt,
    required this.displayName,
    required this.description,
    required this.support,
    required this.isLocal,
    required this.banners,
    required this.ownerAccount,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        name,
        host,
        hostRedundancyAllowed,
        followersCount,
        followersCount,
        createdAt,
        updatedAt,
        displayName,
        description,
        support,
        isLocal,
        banners,
        ownerAccount,
      ];
}

class BannerEntity extends Equatable {
  final String path;
  final int width;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BannerEntity({
    required this.path,
    required this.width,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        path,
        width,
        createdAt,
        updatedAt,
      ];
}

class OwnerAccountEntity extends Equatable {
  final int id;
  final String uuid;

  const OwnerAccountEntity({
    required this.id,
    required this.uuid,
  });

  @override
  List<Object?> get props => [
        id,
        uuid,
      ];
}
