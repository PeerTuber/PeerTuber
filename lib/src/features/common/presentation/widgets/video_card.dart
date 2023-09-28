import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peertuber/src/features/common/data/models/video.dart';
import 'package:peertuber/src/features/common/domain/entities/video.dart';
import 'package:peertuber/src/features/common/presentation/bloc/instance/instance_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoCard extends HookWidget {
  final VideoEntity video;
  final bool hasPadding;
  final Function(VideoEntity)? onTap;
  const VideoCard(
      {Key? key, required this.video, required this.hasPadding, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instanceState = context.read<InstanceCubit>().state;

    late String avatarPath;
    late String thumbnailPath;

    if (video.channel.avatar == null && video.account.avatar != null) {
      avatarPath = video.account.avatar!.url == null
          ? '${instanceState.instance.host}${video.account.avatar!.path}'
          : video.account.avatar!.url!;
    } else if (video.channel.avatar != null) {
      avatarPath = video.channel.avatar!.url == null
          ? '${instanceState.instance.host}${video.channel.avatar!.path}'
          : video.channel.avatar!.url!;
    } else {
      avatarPath = '';
    }

    thumbnailPath = video.thumbnailUrl == null
        ? '${instanceState.instance.host}${video.thumbnailPath}'
        : video.thumbnailUrl!;

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(video);
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
        child: Column(
          children: [
            Stack(
              children: [
                // -- Video Image
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: hasPadding ? 12.0 : 0),
                  child: CachedNetworkImage(
                    imageUrl: thumbnailPath,
                    height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) {
                      return Container(
                        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.orange.shade800,
                        alignment: Alignment.center,
                        child: const Text('Error Loading Image'),
                      );
                    },
                  ),
                ),
                // -- Video Duration
                Positioned(
                  bottom: 8.0,
                  right: hasPadding ? 20.0 : 8.0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: Colors.black,
                    child: Text(
                      formatTimeDuration(video.duration!),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- User Avatar
                  CircleAvatar(
                    onBackgroundImageError: (_, __) {},
                    backgroundImage: CachedNetworkImageProvider(
                      avatarPath,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: Text(
                          video.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold),
                        )),
                        Flexible(
                          child: Text(
                            '${video.channel.displayName} • ${video.views} views • ${timeago.format(video.publishedAt)}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 13.0,
                                      color: Colors.grey,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    size: 20.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
