import 'package:flutter_peertuber/src/features/common/data/models/models.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/entities.dart';

class ChannelModel extends ChannelEntity {
  const ChannelModel(
      {required super.url,
      required super.name,
      required super.host,
      required super.avatars,
      required super.avatar,
      required super.id,
      required super.hostRedundancyAllowed,
      required super.followingCount,
      required super.followersCount,
      required super.createdAt,
      required super.banners,
      required super.displayName,
      required super.description,
      required super.support,
      required super.isLocal,
      required super.updatedAt,
      required super.ownerAccount})
      : super();

  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        url: json["url"],
        name: json["name"],
        host: json["host"],
        avatars: List<AvatarModel>.from(
            json["avatars"].map((x) => AvatarModel.fromJson(x))),
        avatar: json["avatar"] != null
            ? AvatarModel.fromJson(json["avatar"])
            : null,
        id: json["id"],
        hostRedundancyAllowed: json["hostRedundancyAllowed"] ?? false,
        followingCount: json["followingCount"] ?? 0,
        followersCount: json["followersCount"] ?? 0,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        banners: json["banners"] == null
            ? null
            : List<dynamic>.from(json["banners"].map((x) => x)),
        displayName: json["displayName"],
        description: json["description"] ?? '',
        support: json["support"],
        isLocal: json["isLocal"] ?? false,
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        ownerAccount: json["ownerAccount"] == null
            ? null
            : AccountModel.fromJson(json["ownerAccount"]),
      );
}

class LanguageModel extends LanguageEntity {
  const LanguageModel({required super.id, required super.label}) : super();

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}
