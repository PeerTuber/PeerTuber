// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/auth/domain/entities/logged_in_user.dart';
import 'package:peertuber/src/features/common/data/models/models.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  final AccountModel? account;
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
  final RoleModel role;
  final String theme;
  final Username username;
  final List<ChannelModel> videoChannels;
  final int videoQuota;
  final int videoQuotaDaily;
  final bool p2PEnabled;

  const UserModel({
    this.account,
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

  static const empty = UserModel(
    account: null,
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
    role: RoleModel(id: 0, label: ''),
    theme: '',
    username: Username.pure(),
    videoChannels: [],
    videoQuota: 0,
    videoQuotaDaily: 0,
    p2PEnabled: false,
  );

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      account: AccountModel.fromEntity(user.account),
      autoPlayNextVideo: user.autoPlayNextVideo,
      autoPlayNextVideoPlaylist: user.autoPlayNextVideoPlaylist,
      autoPlayVideo: user.autoPlayVideo,
      blocked: user.blocked,
      blockedReason: user.blockedReason,
      createdAt: user.createdAt,
      email: user.email,
      emailVerified: user.emailVerified,
      id: user.id,
      pluginAuth: user.pluginAuth,
      lastLoginDate: user.lastLoginDate,
      noInstanceConfigWarningModal: user.noInstanceConfigWarningModal,
      noAccountSetupWarningModal: user.noAccountSetupWarningModal,
      noWelcomeModal: user.noWelcomeModal,
      nsfwPolicy: user.nsfwPolicy,
      role: RoleModel.fromEntity(user.role),
      theme: user.theme,
      username: user.username,
      videoChannels:
          user.videoChannels.map((e) => ChannelModel.fromEntity(e)).toList(),
      videoQuota: user.videoQuota,
      videoQuotaDaily: user.videoQuotaDaily,
      p2PEnabled: user.p2PEnabled,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      account: account!.toEntity(),
      autoPlayNextVideo: autoPlayNextVideo,
      autoPlayNextVideoPlaylist: autoPlayNextVideoPlaylist,
      autoPlayVideo: autoPlayVideo,
      blocked: blocked,
      blockedReason: blockedReason,
      createdAt: createdAt,
      email: email,
      emailVerified: emailVerified,
      id: id,
      pluginAuth: pluginAuth,
      lastLoginDate: lastLoginDate,
      noInstanceConfigWarningModal: noInstanceConfigWarningModal,
      noAccountSetupWarningModal: noAccountSetupWarningModal,
      noWelcomeModal: noWelcomeModal,
      nsfwPolicy: nsfwPolicy,
      role: role.toEntity(),
      theme: theme,
      username: username,
      videoChannels: videoChannels.map((e) => e.toEntity()).toList(),
      videoQuota: videoQuota,
      videoQuotaDaily: videoQuotaDaily,
      p2PEnabled: p2PEnabled,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        account: AccountModel.fromJson(json["account"]),
        autoPlayNextVideo: json["autoPlayNextVideo"],
        autoPlayNextVideoPlaylist: json["autoPlayNextVideoPlaylist"],
        autoPlayVideo: json["autoPlayVideo"],
        blocked: json["blocked"],
        blockedReason: json["blockedReason"],
        createdAt: json["createdAt"],
        email: Email.dirty(json["email"]),
        emailVerified: json["emailVerified"],
        id: json["id"],
        pluginAuth: json["pluginAuth"],
        lastLoginDate: DateTime.parse(json["lastLoginDate"]),
        noInstanceConfigWarningModal: json["noInstanceConfigWarningModal"],
        noAccountSetupWarningModal: json["noAccountSetupWarningModal"],
        noWelcomeModal: json["noWelcomeModal"],
        nsfwPolicy: json["nsfwPolicy"],
        role: RoleModel.fromJson(json["role"]),
        theme: json["theme"],
        username: Username.dirty(json["username"]),
        videoChannels: List<ChannelModel>.from(
            json["videoChannels"].map((x) => ChannelModel.fromJson(x))),
        videoQuota: json["videoQuota"],
        videoQuotaDaily: json["videoQuotaDaily"],
        p2PEnabled: json["p2pEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "autoPlayNextVideo": autoPlayNextVideo,
        "autoPlayNextVideoPlaylist": autoPlayNextVideoPlaylist,
        "autoPlayVideo": autoPlayVideo,
        "blocked": blocked,
        "blockedReason": blockedReason,
        "createdAt": createdAt,
        "email": email,
        "emailVerified": emailVerified,
        "id": id,
        "pluginAuth": pluginAuth,
        "lastLoginDate": lastLoginDate?.toIso8601String(),
        "noInstanceConfigWarningModal": noInstanceConfigWarningModal,
        "noAccountSetupWarningModal": noAccountSetupWarningModal,
        "noWelcomeModal": noWelcomeModal,
        "nsfwPolicy": nsfwPolicy,
        "role": role.toJson(),
        "theme": theme,
        "username": username,
        "videoChannels": List<dynamic>.from(
            videoChannels.map((x) => (x as RoleModel).toJson())),
        "videoQuota": videoQuota,
        "videoQuotaDaily": videoQuotaDaily,
        "p2pEnabled": p2PEnabled,
      };

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

class RoleModel extends Equatable {
  final int id;
  final String label;

  const RoleModel({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];

  RoleEntity toEntity() {
    return RoleEntity(
      id: id,
      label: label,
    );
  }

  factory RoleModel.fromEntity(RoleEntity role) {
    return RoleModel(
      id: role.id,
      label: role.label,
    );
  }

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class BannerModel extends Equatable {
  final String path;
  final int width;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BannerModel({
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

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
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

class OwnerAccountModel extends Equatable {
  final int id;
  final String uuid;

  const OwnerAccountModel({
    required this.id,
    required this.uuid,
  });

  @override
  List<Object?> get props => [
        id,
        uuid,
      ];

  factory OwnerAccountModel.fromJson(Map<String, dynamic> json) =>
      OwnerAccountModel(
        id: json["id"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
      };
}
