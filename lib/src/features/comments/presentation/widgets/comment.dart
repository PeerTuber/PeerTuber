import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/common/domain/entities/channel.dart';
import 'package:peertuber/src/features/common/presentation/bloc/instance/instance_cubit.dart';
import 'package:peertuber/src/features/common/presentation/widgets/avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
    this.isSoloComment = false,
    this.isInThread = false,
    this.hasPadding = true,
  });

  final CommentEntity comment;
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
          padding: EdgeInsets.symmetric(
            horizontal: hasPadding ? 20 : 0,
            vertical: hasPadding ? 15 : 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarWidget(
                types: (account: comment.account, channel: ChannelEntity.empty),
                target: AvatarTarget.account,
                host: instance.host,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!-- DISPLAY NAME
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        '@${comment.account.name} • ${timeago.format(comment.createdAt!)}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ),

                    //!-- HTML RENDERER
                    Html(
                      data: comment.text,
                      shrinkWrap: true,
                      doNotRenderTheseTags: {'br'},
                      extensions: [
                        TagExtension(
                          tagsToExtend: {'a'},
                          builder: (ctx) {
                            if (ctx.innerHtml.contains('@')) {
                              return GestureDetector(
                                onTap: () {
                                  print('tapped');
                                },
                                child: Text(
                                  '@${ctx.elementChildren.first.text}',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                    Visibility(
                      visible: comment.totalReplies > 0,
                      child: Visibility(
                        visible: !isInThread,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            '${comment.totalReplies} replies',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
