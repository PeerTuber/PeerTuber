import 'dart:async';

import 'package:peertuber/src/core/error/exceptions.dart';
import 'package:peertuber/src/features/common/data/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';

abstract class VideoDetailsRemoteDataSource {
  /// Calls the https://{host}/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<VideoModel> getVideoDetailsById(int id);
  Future<VideoModel> getVideoDetailsByUrl(String videoUrl, String videoUuid);
  Stream<VideoEntity?> get videoDetails;
}

@LazySingleton(as: VideoDetailsRemoteDataSource)
class VideoDetailsRemoteDataSourceImpl implements VideoDetailsRemoteDataSource {
  final http.Client client;
  final _controller = StreamController<VideoEntity>();

  VideoDetailsRemoteDataSourceImpl({required this.client});

  @override
  Stream<VideoEntity?> get videoDetails async* {
    yield null;
    yield* _controller.stream;
  }

  @override
  Future<VideoModel> getVideoDetailsById(int id) async {
    // TODO(mikehuntington): remove neovibe.app from url
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
      final video = videoFromJson(response.body);
      _controller.add(video.toEntity());
      return video;
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
      VideoModel video = VideoModel.withRemoteHost(
          videoFromJson(response.body), videoUri.origin);
      _controller.add(video.toEntity());
      return video;
    } else {
      throw ServerException();
    }
  }
}
