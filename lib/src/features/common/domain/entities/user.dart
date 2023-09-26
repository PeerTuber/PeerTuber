// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

class UserEntity extends Equatable {
  final AccountEntity account;
  final bool autoPlayNextVideo;
  final bool autoPlayNextVideoPlaylist;
  final bool autoPlayVideo;
  final bool blocked;
  final String blockedReason;
  final String createdAt;
  final Email email;
  final bool emailVerified;
  final int id;
  final String pluginAuth;
  final DateTime? lastLoginDate;
  final bool noInstanceConfigWarningModal;
  final bool noAccountSetupWarningModal;
  final bool noWelcomeModal;
  final String nsfwPolicy;
  final RoleEntity role;
  final String theme;
  final Username username;
  final List<ChannelEntity> videoChannels;
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
    this.lastLoginDate,
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

  static const empty = UserEntity(
    account: AccountEntity.empty,
    autoPlayNextVideo: false,
    autoPlayNextVideoPlaylist: false,
    autoPlayVideo: false,
    blocked: false,
    blockedReason: '',
    createdAt: '',
    email: Email.pure(),
    emailVerified: false,
    id: 0,
    pluginAuth: '',
    lastLoginDate: null,
    noInstanceConfigWarningModal: false,
    noAccountSetupWarningModal: false,
    noWelcomeModal: false,
    nsfwPolicy: '',
    role: RoleEntity(id: 0, label: ''),
    theme: '',
    username: Username.pure(),
    videoChannels: [],
    videoQuota: 0,
    videoQuotaDaily: 0,
    p2PEnabled: false,
  );

  UserEntity copyWith({
    AccountEntity? account,
    bool? autoPlayNextVideo,
    bool? autoPlayNextVideoPlaylist,
    bool? autoPlayVideo,
    bool? blocked,
    String? blockedReason,
    String? createdAt,
    Email? email,
    bool? emailVerified,
    int? id,
    String? pluginAuth,
    DateTime? lastLoginDate,
    bool? noInstanceConfigWarningModal,
    bool? noAccountSetupWarningModal,
    bool? noWelcomeModal,
    String? nsfwPolicy,
    RoleEntity? role,
    String? theme,
    Username? username,
    List<ChannelEntity>? videoChannels,
    int? videoQuota,
    int? videoQuotaDaily,
    bool? p2PEnabled,
  }) {
    return UserEntity(
      account: account ?? this.account,
      autoPlayNextVideo: autoPlayNextVideo ?? this.autoPlayNextVideo,
      autoPlayNextVideoPlaylist:
          autoPlayNextVideoPlaylist ?? this.autoPlayNextVideoPlaylist,
      autoPlayVideo: autoPlayVideo ?? this.autoPlayVideo,
      blocked: blocked ?? this.blocked,
      blockedReason: blockedReason ?? this.blockedReason,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      id: id ?? this.id,
      pluginAuth: pluginAuth ?? this.pluginAuth,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      noInstanceConfigWarningModal:
          noInstanceConfigWarningModal ?? this.noInstanceConfigWarningModal,
      noAccountSetupWarningModal:
          noAccountSetupWarningModal ?? this.noAccountSetupWarningModal,
      noWelcomeModal: noWelcomeModal ?? this.noWelcomeModal,
      nsfwPolicy: nsfwPolicy ?? this.nsfwPolicy,
      role: role ?? this.role,
      theme: theme ?? this.theme,
      username: username ?? this.username,
      videoChannels: videoChannels ?? this.videoChannels,
      videoQuota: videoQuota ?? this.videoQuota,
      videoQuotaDaily: videoQuotaDaily ?? this.videoQuotaDaily,
      p2PEnabled: p2PEnabled ?? this.p2PEnabled,
    );
  }

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
