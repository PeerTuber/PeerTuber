import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/features/common/data/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class VideoDetailsRemoteDataSource {
  /// Calls the https://{host}/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<VideoModel> getVideoDetailsById(int id);
  Future<VideoModel> getVideoDetailsByUrl(String videoUrl, String videoUuid);
}

@LazySingleton(as: VideoDetailsRemoteDataSource)
class VideoDetailsRemoteDataSourceImpl implements VideoDetailsRemoteDataSource {
  final http.Client client;

  VideoDetailsRemoteDataSourceImpl({required this.client});

  @override
  Future<VideoModel> getVideoDetailsById(int id) async {
    final url = 'https://vids.neovibe.app/api/v1/videos/$id';
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response =
          await client.get(uri, headers: {'Content-Type': 'application/json'});
    } on http.ClientException {
      throw ServerException();
    }

    if (response.statusCode == 200) {
      return videoFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<VideoModel> getVideoDetailsByUrl(
      String videoUrl, String videoUuid) async {
    final videoUri = Uri.parse(videoUrl);
    final url = '${videoUri.origin}/api/v1/videos/$videoUuid';
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response =
          await client.get(uri, headers: {'Content-Type': 'application/json'});
    } on http.ClientException {
      throw ServerException();
    }

    if (response.statusCode == 200) {
      VideoModel video = videoFromJson(response.body);
      return VideoModel.withRemoteHost(video, videoUri.origin);
    } else {
      throw ServerException();
    }
  }
}
