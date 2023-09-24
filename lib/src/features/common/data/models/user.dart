// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
// Generated with https://app.quicktype.io/

import 'dart:convert';

import 'package:flutter_peertuber/src/features/common/data/models/models.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/entities.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  const UserModel(
      {required super.account,
      required super.autoPlayNextVideo,
      required super.autoPlayNextVideoPlaylist,
      required super.autoPlayVideo,
      required super.blocked,
      required super.blockedReason,
      required super.createdAt,
      required super.email,
      required super.emailVerified,
      required super.id,
      required super.pluginAuth,
      required super.lastLoginDate,
      required super.noInstanceConfigWarningModal,
      required super.noAccountSetupWarningModal,
      required super.noWelcomeModal,
      required super.nsfwPolicy,
      required super.role,
      required super.theme,
      required super.username,
      required super.videoChannels,
      required super.videoQuota,
      required super.videoQuotaDaily,
      required super.p2PEnabled});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        account: AccountModel.fromJson(json["account"]),
        autoPlayNextVideo: json["autoPlayNextVideo"],
        autoPlayNextVideoPlaylist: json["autoPlayNextVideoPlaylist"],
        autoPlayVideo: json["autoPlayVideo"],
        blocked: json["blocked"],
        blockedReason: json["blockedReason"],
        createdAt: json["createdAt"],
        email: json["email"],
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
        username: json["username"],
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
        "lastLoginDate": lastLoginDate.toIso8601String(),
        "noInstanceConfigWarningModal": noInstanceConfigWarningModal,
        "noAccountSetupWarningModal": noAccountSetupWarningModal,
        "noWelcomeModal": noWelcomeModal,
        "nsfwPolicy": nsfwPolicy,
        "role": (role as RoleModel).toJson(),
        "theme": theme,
        "username": username,
        "videoChannels": List<dynamic>.from(
            videoChannels.map((x) => (x as RoleModel).toJson())),
        "videoQuota": videoQuota,
        "videoQuotaDaily": videoQuotaDaily,
        "p2pEnabled": p2PEnabled,
      };
}

class RoleModel extends RoleEntity {
  const RoleModel({required super.id, required super.label});

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class BannerModel extends BannerEntity {
  const BannerModel(
      {required super.path,
      required super.width,
      required super.createdAt,
      required super.updatedAt});

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

class OwnerAccountModel extends OwnerAccountEntity {
  const OwnerAccountModel({required super.id, required super.uuid});

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
