import 'package:dartz/dartz.dart';
import 'package:flutter_peertuber/src/features/common/domain/repositories/search_videos_repository.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
import 'package:flutter_peertuber/src/core/error/failures.dart';
import 'package:flutter_peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchVideosUseCase implements UseCase<List<VideoEntity>, SearchParams> {
  final SearchVideosRepository repository;

  SearchVideosUseCase(this.repository);

  @override
  Future<Either<Failure, List<VideoEntity>>> call(SearchParams params) async {
    return await repository.searchVideos(params.searchData);
  }
}
