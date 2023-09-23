import 'package:flutter_peertuber/src/features/common/data/models/video.dart';
import 'package:flutter_peertuber/src/features/common/domain/entities/video.dart';

import 'account_mock.dart';
import 'category_mock.dart';
import 'channel_mock.dart';
import 'language_mock.dart';

final tVideoModel = VideoModel(
    id: 1,
    uuid: 'd8f660ba-152f-43e4-87da-cae69eee1790',
    shortUuid: 'sMUqbgQWqGozGw8g2t1Ke3',
    url: 'https://video.app/videos/watch/d8f660ba-152f-43e4-87da-cae69eee1790',
    name: 'My Test Video',
    category: tCategory,
    licence: tLanguage,
    language: tLanguage,
    privacy: tCategory,
    nsfw: false,
    truncatedDescription: 'Video description...',
    description: 'Video description...',
    isLocal: true,
    duration: 1,
    views: 1,
    viewers: 1,
    likes: 1,
    dislikes: 1,
    thumbnailPath:
        '/static/thumbnails/3d3cc270-af78-4ae8-9de2-5002d34a79e8.jpg',
    previewPath:
        '/lazy-static/previews/833974db-6b62-4754-959b-f3efbe96d666.jpg',
    embedPath: '/videos/embed/d8f660ba-152f-43e4-87da-cae69eee1790',
    createdAt: DateTime.parse('2023-08-21T23:15:32.920Z'),
    updatedAt: DateTime.parse('2023-08-23T01:56:55.728Z'),
    publishedAt: DateTime.parse('2023-08-21T23:16:54.240Z'),
    originallyPublishedAt: DateTime.parse('2023-08-21T00:00:00.000Z'),
    isLive: false,
    account: tAccount,
    channel: tChannel);

final tVideo = VideoEntity(
    id: 1,
    uuid: 'uuid',
    shortUuid: 'shortUuid',
    url: 'url',
    remoteHost: 'url',
    name: 'name',
    category: tCategory,
    licence: tLanguage,
    language: tLanguage,
    privacy: tCategory,
    nsfw: false,
    truncatedDescription: 'truncatedDescription',
    description: 'description',
    isLocal: true,
    duration: 20,
    views: 1,
    viewers: 1,
    likes: 1,
    dislikes: 1,
    thumbnailPath: 'thumbnailPath',
    previewPath: 'previewPath',
    embedPath: 'embedPath',
    createdAt: DateTime(2023),
    updatedAt: DateTime(2023),
    publishedAt: DateTime(2023),
    originallyPublishedAt: DateTime(2023),
    isLive: false,
    account: tAccount,
    channel: tChannel,
    blacklisted: false,
    blacklistedReason: 'blacklistedReason',
    streamingPlaylists: [],
    files: [],
    support: [],
    descriptionPath: 'descriptionPath',
    tags: ['gaming', 'playstation'],
    commentsEnabled: true,
    downloadEnabled: false,
    waitTranscoding: false,
    state: tCategory,
    trackerUrls: []);

final tHomeVideos = [tVideo];
