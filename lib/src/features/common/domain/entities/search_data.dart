import 'package:equatable/equatable.dart';
import 'package:peertuber/src/core/constants/enums.dart';

class SearchDataEntity extends Equatable {
  final String instanceHost;
  // Search string
  final String search;
  // Search string
  final SearchTargetType? searchTarget;
  // Offset used to paginate results
  final int? start;
  // Number of items to return (default 15)
  final int count;
  // if total isn't needed in the response
  final bool skipCount;
  // Get videos that have this maximum duration
  final int? durationMax;
  // Get videos that have this maximum duration
  final int? durationMin;
  // Get videos that are published before this date
  final DateTime? endDate;
  // Get videos that are published after this date
  final DateTime? startDate;
  // Whether or not to exclude videos that are in the user's video history
  final bool excludeAlreadyWatched;
  // whether to include nsfw videos, if any
  final bool nsfw;
  // tag(s) of the video, where all should be present in the video
  final List<String>? tagsOfAll;
  // tag(s) of the video
  final List<String>? tagsOfOne;
  // Sort videos by criteria (prefixing with - means DESC order):
  final SortType? sort;
  // Video id of the target video
  final int? targetVideoId;
  // Video uuid of the target video
  final String? targetVideoUuid;

  const SearchDataEntity({
    required this.instanceHost,
    required this.search,
    this.searchTarget = SearchTargetType.local,
    this.sort = SortType.publishedAt,
    this.start = 0,
    this.count = 15,
    this.skipCount = false,
    this.durationMax,
    this.durationMin,
    this.endDate,
    this.startDate,
    this.excludeAlreadyWatched = false,
    this.nsfw = true,
    this.tagsOfAll,
    this.tagsOfOne,
    this.targetVideoId,
    this.targetVideoUuid,
  });

  SearchDataEntity copyWith({
    String? instanceHost,
    String? search,
    SearchTargetType? searchTarget,
    int? start,
    int? count,
    bool? skipCount,
    int? durationMax,
    int? durationMin,
    DateTime? endDate,
    DateTime? startDate,
    bool? excludeAlreadyWatched,
    bool? nsfw,
    List<String>? tagsOfAll,
    List<String>? tagsOfOne,
    SortType? sort,
    int? targetVideoId,
    String? targetVideoUuid,
  }) {
    return SearchDataEntity(
      instanceHost: instanceHost ?? this.instanceHost,
      search: search ?? this.search,
      searchTarget: searchTarget ?? this.searchTarget,
      start: start ?? this.start,
      count: count ?? this.count,
      skipCount: skipCount ?? this.skipCount,
      durationMax: durationMax ?? this.durationMax,
      durationMin: durationMin ?? this.durationMin,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
      excludeAlreadyWatched:
          excludeAlreadyWatched ?? this.excludeAlreadyWatched,
      nsfw: nsfw ?? this.nsfw,
      tagsOfAll: tagsOfAll ?? this.tagsOfAll,
      tagsOfOne: tagsOfOne ?? this.tagsOfOne,
      sort: sort ?? this.sort,
      targetVideoId: targetVideoId ?? this.targetVideoId,
      targetVideoUuid: targetVideoUuid ?? this.targetVideoUuid,
    );
  }

  @override
  List<Object?> get props => [
        instanceHost,
        search,
        searchTarget,
        sort,
        start,
        count,
        skipCount,
        durationMax,
        durationMin,
        endDate,
        startDate,
        excludeAlreadyWatched,
        nsfw,
        tagsOfAll,
        tagsOfOne,
        targetVideoId,
        targetVideoUuid,
      ];
}
