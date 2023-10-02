import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/core/util/get_avatar_path.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget(
      {super.key,
      required this.types,
      required this.target,
      required this.host});
  final AvatarTypes types;
  final AvatarTarget target;
  final String host;

  @override
  Widget build(BuildContext context) {
    final String avatarPath = GetAvatarPath.avatarPath(
      types: types,
      target: target,
      instanceHost: host,
    );

    return CircleAvatar(
      onBackgroundImageError: (_, __) {},
      backgroundImage: CachedNetworkImageProvider(
        avatarPath,
      ),
    );
  }
}
