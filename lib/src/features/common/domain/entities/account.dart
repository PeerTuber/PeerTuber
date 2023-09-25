import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

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
    this.followingCount = 0,
    this.followersCount = 0,
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

  static const empty = AccountEntity(
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
    updatedAt: null,
    userId: null,
  );
}
