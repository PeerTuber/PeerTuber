import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

class ChannelEntity extends Equatable {
  final String url;
  final String name;
  final String host;
  final List<AvatarEntity>? avatars;
  final AvatarEntity? avatar;
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

  static const empty = ChannelEntity(
    url: '',
    name: '',
    host: '',
    avatars: [],
    avatar: null,
    id: 0,
    hostRedundancyAllowed: false,
    followingCount: 0,
    followersCount: 0,
    createdAt: null,
    banners: null,
    displayName: '',
    description: '',
    support: null,
    isLocal: false,
    updatedAt: null,
    ownerAccount: null,
  );

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
