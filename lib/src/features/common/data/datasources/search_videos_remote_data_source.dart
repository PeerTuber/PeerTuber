import 'dart:convert';

import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/core/network/cache_client.dart';
import 'package:peertuber/src/features/common/data/models/search_data.dart';
import 'package:peertuber/src/features/common/data/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class SearchVideosRemoteDataSource {
  /// Calls the https://{host}/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<VideoModel>> searchVideos(
      {required SearchDataModel searchData, int? videoId});
}

@LazySingleton(as: SearchVideosRemoteDataSource)
class SearchVideosRemoteDataSourceImpl implements SearchVideosRemoteDataSource {
  final CacheClient cacheClient;
  final http.Client client;

  SearchVideosRemoteDataSourceImpl({
    required this.cacheClient,
    required this.client,
  });

  // Cache key for the fetched video details
  static const videoSearchCacheKey = '__video_search_cache_key';

  @override
  Future<List<VideoModel>> searchVideos(
      {required SearchDataModel searchData, int? videoId}) async {
    List<VideoModel>? cachedVideos =
        cacheClient.read('${videoSearchCacheKey}_$videoId');

    // Check if the search results are cached and return them if they are
    if (cachedVideos != null) {
      return cachedVideos;
    }
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
        ..removeWhere((video) => video.id == videoId);

      // Add the videos to the cache
      cacheClient.write(key: '${videoSearchCacheKey}_$videoId', value: videos);
      return videos;
    } else {
      throw ServerException();
    }
  }
}
