import 'package:equatable/equatable.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/entities.dart';

class ChannelEntity extends Equatable {
  final String url;
  final String name;
  final String host;
  final List<AvatarEntity> avatars;
  final AvatarEntity? avatar;
  final int id;
  final bool hostRedundancyAllowed;
  final int followingCount;
  final int followersCount;
  final DateTime? createdAt;
  final List<dynamic>? banners;
  final String displayName;
  final String description;
  final dynamic support;
  final bool isLocal;
  final DateTime? updatedAt;
  final AccountEntity? ownerAccount;

  const ChannelEntity({
    required this.url,
    required this.name,
    required this.host,
    required this.avatars,
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
}
