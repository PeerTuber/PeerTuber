import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peertuber/src/features/common/data/models/models.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountModel extends Equatable {
  final String url;
  final String name;
  final String host;
  final List<AvatarModel> avatars;
  final AvatarModel? avatar;
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

  const AccountModel({
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

  factory AccountModel.fromEntity(AccountEntity entity) => AccountModel(
        url: entity.url,
        name: entity.name,
        host: entity.host,
        avatars: entity.avatars
            .map((avatar) => AvatarModel.fromEntity(avatar))
            .toList(),
        avatar: AvatarModel.fromEntity(entity.avatar!),
        id: entity.id,
        hostRedundancyAllowed: entity.hostRedundancyAllowed,
        followingCount: entity.followingCount,
        followersCount: entity.followersCount,
        createdAt: entity.createdAt,
        banners: entity.banners,
        displayName: entity.displayName,
        description: entity.description,
        updatedAt: entity.updatedAt,
        userId: entity.userId,
      );

  static const empty = AccountModel(
    url: '',
    name: '',
    host: '',
    avatars: [],
    avatar: null,
    id: 0,
    displayName: '',
  );

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
