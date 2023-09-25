import 'dart:convert';

import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/features/common/data/models/video.dart';
import 'package:peertuber/src/features/home/data/datasources/home_videos_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../../core/fixtures/fixture_reader.dart';
import 'home_videos_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late HomeVideosRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = HomeVideosRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('video_list.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getHomeVideos', () {
    const tHost = 'vids.neovibe.app';

    final data = jsonDecode(fixture('video_list.json'));
    final toJson = jsonEncode(data['data']);
    final json = jsonDecode(toJson) as List;
    final tVideoList = json.map((e) {
      final jsonString = jsonEncode(e);
      return videoFromJson(jsonString);
    }).toList();

    test(
      'should perform a GET request on a URL with application/json header',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();

        // act
        dataSource.getHomeVideos();

        // assert
        verify(mockHttpClient.get(
            Uri.parse('https://$tHost/api/v1/videos?start=0&sort=-trending'),
            headers: {'Content-Type': 'application/json'}));
      },
    );

    test(
      'should return home videos when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();

        // act
        final result = await dataSource.getHomeVideos();

        // assert
        expect(result, equals(tVideoList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other error',
      () async {
        // arrange
        setUpMockHttpClientFailure404();

        // act
        final call = dataSource.getHomeVideos;

        // assert
        expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
