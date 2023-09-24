import 'package:dartz/dartz.dart';
import 'package:flutter_peertuber/src/features/common/data/models/video.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';
import 'package:flutter_peertuber/src/core/error/exceptions.dart';
import 'package:flutter_peertuber/src/core/error/failures.dart';
import 'package:flutter_peertuber/src/core/network/network_info.dart';
import 'package:flutter_peertuber/src/features/home/data/datasources/home_videos_remote_data_source.dart';
import 'package:flutter_peertuber/src/features/home/data/repositories/home_videos_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/video_mock.dart';
import 'home_videos_repository_impl_test.mocks.dart';

@GenerateMocks([HomeVideosRemoteDataSource, NetworkInfo])
void main() {
  late HomeVideosRespositoryImpl repository;
  late MockHomeVideosRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockHomeVideosRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = HomeVideosRespositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getHomeVideos', () {
    final VideoModel tVideoMockModel = tVideoModel;
    final VideoEntity tVideoMock = tVideoMockModel;

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getHomeVideos()).thenAnswer((_) async => []);

      // act
      repository.getHomeVideos();

      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getHomeVideos())
            .thenAnswer((_) async => [tVideoMockModel]);

        // act
        final result = await repository.getHomeVideos();

        // assert
        verify(mockRemoteDataSource.getHomeVideos());

        // Get the right side of the Either<>
        final resultVideoList = result.getOrElse(() => List.empty());
        final mockVideoList = [tVideoMock];

        // Check that the first video is valid
        expect(resultVideoList[0], mockVideoList[0]);
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getHomeVideos()).thenThrow(ServerException());

        // act
        final result = await repository.getHomeVideos();

        // assert
        verify(mockRemoteDataSource.getHomeVideos());
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return network failure when there is no network connected',
          () async {
        // arrange
        when(mockRemoteDataSource.getHomeVideos()).thenAnswer((_) async => []);

        // act
        final result = await repository.getHomeVideos();

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });
}
