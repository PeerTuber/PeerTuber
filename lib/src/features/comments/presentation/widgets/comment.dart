import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comments_list.dart';
import 'package:peertuber/src/features/common/domain/entities/channel.dart';
import 'package:peertuber/src/features/common/presentation/bloc/instance/instance_cubit.dart';
import 'package:peertuber/src/features/common/presentation/widgets/avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
    this.data,
    this.depth = 0,
    this.isSoloComment = false,
    this.isInThread = false,
    this.hasPadding = true,
  });

  final CommentEntity comment;
  final CommentsData? data;
  final int depth;
  final bool isSoloComment;
  final bool isInThread;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    final instance = context.read<InstanceCubit>().state.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //!-- AVATAR
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 20,
                  maxHeight: 20,
                ),
                child: AvatarWidget(
                  types: (
                    account: comment.account!,
                    channel: ChannelEntity.empty
                  ),
                  target: AvatarTarget.account,
                  host: instance.host,
                ),
              ),

              //!-- DISPLAY NAME
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  comment.account!.displayName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),

              const Spacer(),

              //!-- POST TIME
              Text(
                timeago.format(comment.createdAt!),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //!-- HTML RENDERER (COMMENT TEXT)
        Html(
          data: comment.text,
          doNotRenderTheseTags: {'br'},
          extensions: [
            TagExtension(
              tagsToExtend: {'a'},
              builder: (ctx) {
                if (ctx.innerHtml.contains('@')) {
                  return GestureDetector(
                    onTap: () {
                      // Tapped
                    },
                    child: Text(
                      '@${ctx.elementChildren.first.text}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return Text(ctx.innerHtml);
                }
              },
            ),
          ],
        ),

        const SizedBox(
          height: 5,
        ),

        //!-- REPLY COUNT
        Visibility(
          visible: !isInThread && comment.totalReplies > 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '${comment.totalReplies} replies',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
