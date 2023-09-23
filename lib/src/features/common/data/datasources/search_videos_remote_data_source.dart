import 'dart:convert';

import 'package:flutter_peertuber/src/core/error/exceptions.dart';
import 'package:flutter_peertuber/src/features/common/data/models/search_data.dart';
import 'package:flutter_peertuber/src/features/common/data/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class SearchVideosRemoteDataSource {
  /// Calls the https://{host}/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<VideoModel>> searchVideos(SearchDataModel searchData);
}

@LazySingleton(as: SearchVideosRemoteDataSource)
class SearchVideosRemoteDataSourceImpl implements SearchVideosRemoteDataSource {
  final http.Client client;

  SearchVideosRemoteDataSourceImpl({required this.client});

  @override
  Future<List<VideoModel>> searchVideos(SearchDataModel searchData) async {
    var query =
        'start=${searchData.start}&count=${searchData.count}&nsfw=both&sort=-publishedAt&searchTarget=search-index';

    for (var i = 0; i < searchData.tagsOfOne!.length; i++) {
      query = '$query&tagsOneOf=${searchData.tagsOfOne![i]}';
    }

    final url = '${searchData.instanceHost}/api/v1/search/videos?$query';
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
      }).toList()
        ..removeWhere(
            (video) => video.id == 0); // Change this to an actual video id
      return videos;
    } else {
      throw ServerException();
    }
  }
}
