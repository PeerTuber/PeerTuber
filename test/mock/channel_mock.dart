import 'package:peertuber/src/features/common/domain/entities/entities.dart';

import 'account_mock.dart';
import 'avatar_mock.dart';

final tChannel = ChannelEntity(
    url: 'https://video.app/video-channels/channel_name',
    name: 'channel_name',
    host: 'video.app',
    avatars: [tAvatar, tAvatar],
    avatar: tAvatar,
    id: 1,
    hostRedundancyAllowed: false,
    followingCount: 33,
    followersCount: 33,
    createdAt: DateTime(2023),
    banners: [],
    displayName: 'Channel Name',
    description: 'description',
    support: false,
    isLocal: true,
    updatedAt: DateTime(2023),
    ownerAccount: tAccount);
