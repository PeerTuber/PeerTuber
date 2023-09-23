import 'package:equatable/equatable.dart';
import 'package:flutter_peertuber/src/core/constants/enums.dart';

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
  });

  @override
  List<Object?> get props => [];
}
