import 'dart:convert';

import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/core/network/cache_client.dart';
import 'package:peertuber/src/features/comments/data/models/comment.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class CommentRemoteDataSource {
  /// Calls the https://{host}/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<CommentModel>> getComments({required int videoId});
}

@LazySingleton(as: CommentRemoteDataSource)
class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final CacheClient cacheClient;
  final http.Client client;

  CommentRemoteDataSourceImpl({
    required this.cacheClient,
    required this.client,
  });

  // Cache key for the fetched video details
  static const videoThreadsCacheKey = '__video_threads_cache_key';

  @override
  Future<List<CommentModel>> getComments({required int videoId}) async {
    List<CommentModel>? cachedVideos =
        cacheClient.read('${videoThreadsCacheKey}_$videoId');

    // Check if the comment results are cached and return them if they are
    if (cachedVideos != null) {
      return cachedVideos;
    }

    final url =
        'https://vids.neovibe.app/api/v1/videos/$videoId/comment-threads';
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

      final comments = json.map((e) {
        return CommentModel.fromJson(e);
      }).toList();

      // Add the videos to the cache
      cacheClient.write(
          key: '${videoThreadsCacheKey}_$videoId', value: comments);
      return comments;
    } else {
      throw ServerException();
    }
  }
}
