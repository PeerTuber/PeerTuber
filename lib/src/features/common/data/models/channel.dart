import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/data/models/models.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

class ChannelModel extends Equatable {
  final String url;
  final String name;
  final String host;
  final List<AvatarModel>? avatars;
  final AvatarModel? avatar;
  final int id;
  final bool hostRedundancyAllowed;
  final int followingCount;
  final int followersCount;
  final DateTime? createdAt;
  final dynamic banners;
  final String displayName;
  final String? description;
  final dynamic support;
  final bool isLocal;
  final DateTime? updatedAt;
  final AccountModel? ownerAccount;

  const ChannelModel({
    required this.url,
    required this.name,
    required this.host,
    this.avatars,
    required this.avatar,
    required this.id,
    required this.hostRedundancyAllowed,
    required this.followingCount,
    required this.followersCount,
    required this.createdAt,
    required this.banners,
    required this.displayName,
    required this.description,
    required this.support,
    required this.isLocal,
    required this.updatedAt,
    required this.ownerAccount,
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
        followersCount,
        followersCount,
        createdAt,
        banners,
        displayName,
        description,
        support,
        isLocal,
        updatedAt,
        ownerAccount,
      ];

  ChannelEntity toEntity() {
    return ChannelEntity(
      url: url,
      name: name,
      host: host,
      avatars: avatars?.map((e) => e.toEntity()).toList(growable: false),
      avatar: avatar?.toEntity(),
      id: id,
      hostRedundancyAllowed: hostRedundancyAllowed,
      followingCount: followingCount,
      followersCount: followersCount,
      createdAt: createdAt,
      banners: banners,
      displayName: displayName,
      description: description,
      support: support,
      isLocal: isLocal,
      updatedAt: updatedAt,
      ownerAccount: ownerAccount?.toEntity(),
    );
  }

  factory ChannelModel.fromEntity(ChannelEntity entity) => ChannelModel(
        url: entity.url,
        name: entity.name,
        host: entity.host,
        avatar: entity.avatar != null
            ? AvatarModel.fromEntity(entity.avatar!)
            : null,
        id: entity.id,
        hostRedundancyAllowed: entity.hostRedundancyAllowed,
        followingCount: entity.followingCount,
        followersCount: entity.followersCount,
        createdAt: entity.createdAt,
        banners: entity.banners,
        displayName: entity.displayName,
        description: entity.description,
        support: entity.support,
        isLocal: entity.isLocal,
        updatedAt: entity.updatedAt,
        ownerAccount: entity.ownerAccount != null
            ? AccountModel.fromEntity(entity.ownerAccount!)
            : null,
      );

  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        url: json["url"],
        name: json["name"],
        host: json["host"],
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
