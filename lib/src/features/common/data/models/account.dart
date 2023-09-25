import 'package:peertuber/src/features/common/data/models/models.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

class AccountModel extends AccountEntity {
  const AccountModel(
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
      required super.updatedAt,
      super.userId});

  AccountEntity toEntity() {
    return AccountEntity(
      url: url,
      name: name,
      host: host,
      avatars: avatars,
      avatar: avatar,
      id: id,
      displayName: displayName,
    );
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
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
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
      );
}
