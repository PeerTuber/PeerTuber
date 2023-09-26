import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';

abstract class UseCase<Type, Params> {
  Type call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<dynamic> get props => [];
}

class NumberParam extends Params {
  final int number;

  NumberParam(this.number);

  @override
  List<dynamic> get props => [number];
}

class SearchParams extends Params {
  final SearchDataEntity searchData;

  SearchParams({required this.searchData});

  @override
  List<dynamic> get props => [searchData];
}

class VideoParams extends Params {
  final VideoEntity video;

  VideoParams({required this.video});

  @override
  List<dynamic> get props => [video];
}
