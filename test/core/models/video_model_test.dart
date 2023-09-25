import 'dart:convert';

import 'package:peertuber/src/features/common/data/models/video.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/video_mock.dart';
import '../fixtures/fixture_reader.dart';

void main() {
  final tModel = tVideoModel;
  group('fromJson', () {
    test(
      'should return a valid video model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('video.json'));

        // act
        final result = VideoModel.fromJson(jsonMap);

        // assert
        expect(result, isA<VideoModel>());
        expect(result.account?.userId, tModel.account?.userId);
      },
    );
  });
}
