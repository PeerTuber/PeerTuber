import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/search_data.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<dynamic> get props => [];
}

class Params extends Equatable {
  final int number;

  const Params(this.number);

  @override
  List<dynamic> get props => [number];
}

class SearchParams extends Equatable {
  final SearchDataEntity searchData;

  const SearchParams({required this.searchData});

  @override
  List<dynamic> get props => [searchData];
}

class VideoParams extends Equatable {
  final VideoEntity video;

  const VideoParams({required this.video});

  @override
  List<dynamic> get props => [video];
}
