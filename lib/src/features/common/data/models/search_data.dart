import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_data.g.dart';

@JsonSerializable()
class SearchDataModel extends SearchDataEntity {
  const SearchDataModel(
      {required super.instanceHost,
      required super.search,
      super.count,
      super.durationMax,
      super.durationMin,
      super.endDate,
      super.excludeAlreadyWatched,
      super.nsfw,
      super.searchTarget,
      super.skipCount,
      super.sort,
      super.start,
      super.startDate,
      super.tagsOfAll,
      super.tagsOfOne})
      : super();

  factory SearchDataModel.fromEntity(SearchDataEntity entity) {
    return SearchDataModel(
      instanceHost: entity.instanceHost,
      search: entity.search,
      count: entity.count,
      durationMax: entity.durationMax,
      durationMin: entity.durationMin,
      endDate: entity.endDate,
      excludeAlreadyWatched: entity.excludeAlreadyWatched,
      nsfw: entity.nsfw,
      searchTarget: entity.searchTarget,
      skipCount: entity.skipCount,
      sort: entity.sort,
      start: entity.start,
      startDate: entity.startDate,
      tagsOfAll: entity.tagsOfAll,
      tagsOfOne: entity.tagsOfOne,
    );
  }

  factory SearchDataModel.fromJson(Map<String, dynamic> json) =>
      _$SearchDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataModelToJson(this);
}
