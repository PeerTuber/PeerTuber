// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      url: json['url'] as String,
      name: json['name'] as String,
      host: json['host'] as String,
      avatars: (json['avatars'] as List<dynamic>?)
          ?.map((e) => AvatarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      avatar: json['avatar'] == null
          ? null
          : AvatarModel.fromJson(json['avatar'] as Map<String, dynamic>),
      id: json['id'] as int,
      hostRedundancyAllowed: json['hostRedundancyAllowed'] as bool?,
      followingCount: json['followingCount'] as int? ?? 0,
      followersCount: json['followersCount'] as int? ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      banners: json['banners'],
      displayName: json['displayName'] as String,
      description: json['description'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'host': instance.host,
      'avatars': instance.avatars,
      'avatar': instance.avatar,
      'id': instance.id,
      'hostRedundancyAllowed': instance.hostRedundancyAllowed,
      'followingCount': instance.followingCount,
      'followersCount': instance.followersCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'banners': instance.banners,
      'displayName': instance.displayName,
      'description': instance.description,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userId': instance.userId,
    };
