import 'dart:convert';

import 'package:flutter_peertuber/src/features/common/data/models/video.dart';
import 'package:flutter_peertuber/src/models/comment_thread.dart';
import 'package:http/http.dart' as http;

class VideoService {
  Future<List<VideoModel>> listVideos(String host) async {
    final url = '$host/api/v1/videos?start=0&sort=-trending';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final toJson = jsonEncode(data['data']);
      final json = jsonDecode(toJson) as List;
      final videos = json.map((e) {
        final jsonString = jsonEncode(e);
        return videoFromJson(jsonString);
      }).toList();
      return videos;
    }

    throw "Something went wrong";
  }

  Future<VideoModel> getNowPlaying(String host, int id) async {
    final url = '$host/api/v1/videos/$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return videoFromJson(response.body);
    }

    throw "Something went wrong";
  }

  void postVideoView(String host, VideoModel video, Duration position) async {
    final url = '$host/api/v1/videos/${video.id}/views';
    final uri = Uri.parse(url);

    try {
      await http.post(
        uri,
        body: jsonEncode({"currentTime": position.inSeconds.toString()}),
        headers: _setHeaders(),
      );
    } on http.ClientException {
      throw "Something went wrong";
    }
  }

  Future<List<CommentThread>> listThreads(String host, VideoModel video) async {
    final url = '$host/api/v1/videos/${video.id}/comment-threads';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final toJson = jsonEncode(data['data']);
      final json = jsonDecode(toJson) as List;
      final comments = json.map((e) {
        final jsonString = jsonEncode(e);
        return commentFromJson(jsonString);
      }).toList();
      return comments;
    }

    throw "Something went wrong";
  }

  Map<String, String> _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'appliction/json',
      };
}
