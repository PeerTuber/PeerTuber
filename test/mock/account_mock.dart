import 'package:peertuber/src/features/common/domain/entities/entities.dart';

import 'avatar_mock.dart';

final tAccount = AccountEntity(
  url: 'https://video.app/accounts/tester',
  name: 'tester',
  host: 'video.app',
  avatars: [tAvatar],
  avatar: tAvatar,
  id: 1,
  displayName: 'Tester',
);
