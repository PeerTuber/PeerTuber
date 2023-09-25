import 'dart:convert';

import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/features/common/data/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class HomeVideosRemoteDataSource {
  /// Calls the https://{host}/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<VideoModel>> getHomeVideos();
}

@LazySingleton(as: HomeVideosRemoteDataSource)
class HomeVideosRemoteDataSourceImpl implements HomeVideosRemoteDataSource {
  final http.Client client;

  HomeVideosRemoteDataSourceImpl({required this.client});

  @override
  Future<List<VideoModel>> getHomeVideos() async {
    const url = 'https://vids.neovibe.app/api/v1/videos?start=0&sort=-trending';
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response =
          await client.get(uri, headers: {'Content-Type': 'application/json'});
    } on http.ClientException {
      throw ServerException();
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final toJson = jsonEncode(data['data']);
      final json = jsonDecode(toJson) as List;
      final videos = json.map((e) {
        final jsonString = jsonEncode(e);
        return videoFromJson(jsonString);
      }).toList();
      return videos;
    } else {
      throw ServerException();
    }
  }
}
