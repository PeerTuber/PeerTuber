import 'package:dartz/dartz.dart';
import 'package:flutter_peertuber/src/features/common/domain/usecases/usecase.dart';
import 'package:flutter_peertuber/src/features/home/domain/repositories/home_videos_repository.dart';
import 'package:flutter_peertuber/src/features/home/domain/usecases/get_home_videos.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/video_mock.dart';
import 'get_home_videos_test.mocks.dart';

@GenerateMocks([HomeVideosRespository])
void main() {
  late GetHomeVideos usecase;
  late MockHomeVideosRespository mockHomeVideosRepository;

  setUp(() {
    mockHomeVideosRepository = MockHomeVideosRespository();
    usecase = GetHomeVideos(mockHomeVideosRepository);
  });

  test('should get a list of videos from the home videos repository', () async {
    // arrange
    when(mockHomeVideosRepository.getHomeVideos())
        .thenAnswer((_) async => Right(tHomeVideos));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, equals(Right(tHomeVideos)));
    verify(mockHomeVideosRepository.getHomeVideos());
    verifyNoMoreInteractions(mockHomeVideosRepository);
  });
}
