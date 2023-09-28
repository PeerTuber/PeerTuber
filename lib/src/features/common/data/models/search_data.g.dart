// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDataModel _$SearchDataModelFromJson(Map<String, dynamic> json) =>
    SearchDataModel(
      instanceHost: json['instanceHost'] as String,
      search: json['search'] as String,
      count: json['count'] as int? ?? 15,
      durationMax: json['durationMax'] as int?,
      durationMin: json['durationMin'] as int?,
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      excludeAlreadyWatched: json['excludeAlreadyWatched'] as bool? ?? false,
      nsfw: json['nsfw'] as bool? ?? true,
      searchTarget: $enumDecodeNullable(
              _$SearchTargetTypeEnumMap, json['searchTarget']) ??
          SearchTargetType.local,
      skipCount: json['skipCount'] as bool? ?? false,
      sort: $enumDecodeNullable(_$SortTypeEnumMap, json['sort']) ??
          SortType.publishedAt,
      start: json['start'] as int? ?? 0,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      tagsOfAll: (json['tagsOfAll'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tagsOfOne: (json['tagsOfOne'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      targetVideoId: json['targetVideoId'] as int?,
      targetVideoUuid: json['targetVideoUuid'] as String?,
    );

Map<String, dynamic> _$SearchDataModelToJson(SearchDataModel instance) =>
    <String, dynamic>{
      'instanceHost': instance.instanceHost,
      'search': instance.search,
      'searchTarget': _$SearchTargetTypeEnumMap[instance.searchTarget],
      'start': instance.start,
      'count': instance.count,
      'skipCount': instance.skipCount,
      'durationMax': instance.durationMax,
      'durationMin': instance.durationMin,
      'endDate': instance.endDate?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'excludeAlreadyWatched': instance.excludeAlreadyWatched,
      'nsfw': instance.nsfw,
      'tagsOfAll': instance.tagsOfAll,
      'tagsOfOne': instance.tagsOfOne,
      'sort': _$SortTypeEnumMap[instance.sort],
      'targetVideoId': instance.targetVideoId,
      'targetVideoUuid': instance.targetVideoUuid,
    };

const _$SearchTargetTypeEnumMap = {
  SearchTargetType.local: 'local',
  SearchTargetType.searchIndex: 'searchIndex',
};

const _$SortTypeEnumMap = {
  SortType.name: 'name',
  SortType.duration: 'duration',
  SortType.createdAt: 'createdAt',
  SortType.publishedAt: 'publishedAt',
  SortType.views: 'views',
  SortType.likes: 'likes',
  SortType.match: 'match',
};
