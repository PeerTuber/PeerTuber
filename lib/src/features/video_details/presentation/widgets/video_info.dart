import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/comments/presentation/bloc/comments/comments_cubit.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comments_preview.dart';
import 'package:peertuber/src/features/common/domain/entities/entities.dart';
import 'package:peertuber/src/features/common/presentation/bloc/instance/instance_cubit.dart';
import 'package:peertuber/src/features/common/presentation/bloc/slide_up_panel/slide_up_panel_cubit.dart';
import 'package:peertuber/src/features/common/presentation/widgets/avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  final VideoEntity video;

  const VideoInfo({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '${video.views} views • ${timeago.format(video.publishedAt)}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14.0, color: Colors.grey, letterSpacing: 0.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Divider(),
          _AuthorInfo(
            account: video.account,
            channel: video.channel,
          ),
          const Divider(),
          _buildActionRow(context, video),
          const Divider(),
          BlocBuilder<CommentsCubit, CommentsState>(
            buildWhen: (previous, current) {
              if (current is CommentsLoaded) {
                return current.replies != null && current.replies!.isEmpty;
              }

              return false;
            },
            builder: (context, state) {
              if (state is CommentsLoaded && state.comments!.isNotEmpty) {
                return CommentsPreview(
                  onTap: () {
                    context.read<SlideUpPanelCubit>().openPanel();
                  },
                  comment: state.comments!.first,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildActionRow(BuildContext context, VideoEntity video) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _buildAction(context, Icons.thumb_up_outlined, video.likes.toString()),
      _buildAction(
          context, Icons.thumb_down_outlined, video.dislikes.toString()),
      _buildAction(context, Icons.reply_outlined, 'Share'),
      _buildAction(context, Icons.download_outlined, 'Download'),
      _buildAction(context, Icons.library_add_outlined, 'Save'),
    ],
  );
}

Widget _buildAction(BuildContext context, IconData icon, String label) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        )
      ],
    ),
  );
}

class _AuthorInfo extends StatelessWidget {
  final AccountEntity account;
  final ChannelEntity channel;

  const _AuthorInfo({
    Key? key,
    required this.account,
    required this.channel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instanceState = context.read<InstanceCubit>().state;

    return Row(
      children: [
        AvatarWidget(
          types: (channel: channel, account: account),
          target: AvatarTarget.channel,
          host: instanceState.instance.host,
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
                channel.displayName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold),
              )),
              Flexible(
                child: Text(
                  '${channel.followersCount} subscribers',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'SUBSCRIBE',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
