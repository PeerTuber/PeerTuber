import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:peertuber/src/core/constants/enums.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';
import 'package:peertuber/src/features/comments/presentation/screens/comment_screen.dart';
import 'package:peertuber/src/features/comments/presentation/styles/comment_cell_style.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comments_list.dart';
import 'package:peertuber/src/features/common/domain/entities/channel.dart';
import 'package:peertuber/src/features/common/presentation/bloc/instance/instance_cubit.dart';
import 'package:peertuber/src/features/common/presentation/widgets/avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentCell extends StatelessWidget {
  const CommentCell({
    super.key,
    this.style,
    this.hasReplyLine = false,
    this.hasRightPadding = true,
    this.depth = 0,
    this.replyIndex = 0,
    required this.index,
    required this.isThread,
    required this.navKey,
    required this.contentId,
    required this.data,
  });

  final CommentCellStyle? style;
  final bool hasReplyLine;
  final bool hasRightPadding;
  final int depth;
  final int replyIndex;

  final int index;
  final bool isThread;
  final GlobalKey<NavigatorState>? navKey;
  final int? contentId;
  final CommentsData data;

  @override
  Widget build(BuildContext context) {
    // Theme
    CommentCellStyle defaultStyle =
        Theme.of(context).extension<CommentCellStyle>()!;

    // Comment
    final comment =
        isThread ? data.replies![index - 1].comment : data.comments![index - 1];

    // Replies
    final List<CommentReplyEntity> replies =
        isThread ? data.replies![index - 1].children : List.empty();

    // Instance
    final instance = context.read<InstanceCubit>().state.instance;

    // TODO(mikehuntington): Style this 'comment deleted' widget to look better
    if (comment.isDeleted) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
            depth == 0 ? 10 : 0, 40, hasRightPadding ? 10 : 0, 40),
        child: const Center(child: Text("This comment is deleted")),
      );
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(depth == 0 ? 10 : 0, replyIndex > 0 ? 10 : 0,
          hasRightPadding ? 10 : 0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: style?.cellTopBorder ?? defaultStyle.cellTopBorder,
          ),
        ),
        child: GestureDetector(
            onTap: () {
              // Don't allow the gesture to be triggered if this is a thread
              if (isThread) return;

              // Don't allow the gesture to be triggered if there are no replies
              if (data.comments![index - 1].totalReplies == 0) return;

              navKey?.currentState
                  ?.push<void>(MaterialPageRoute(builder: (context) {
                return CommentsScreen(
                  key: UniqueKey(),
                  navKey: navKey,
                  isThread: true,
                  contentId: contentId!,
                  parent: data.comments![index - 1],
                );
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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

                //!-- COMMENT TEXT
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(
                      style?.threadLineSpacing ??
                          defaultStyle.threadLineSpacing,
                      1,
                      0,
                      0),
                  decoration: BoxDecoration(
                      border: Border(
                    left: BorderSide(
                      color: hasReplyLine
                          ? style?.threadLineColor1 ??
                              _getThreadLineColor(depth, defaultStyle)
                          : Colors.transparent,
                      width: 3,
                    ),
                  )),
                  child: Column(
                    children: [
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                        visible: comment.totalReplies > 0,
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

                      //!-- CHILDREN REPLY LIST VIEW
                      Visibility(
                        visible: isThread ? replies.isNotEmpty : false,
                        child: CommentsList(
                          isThread: isThread,
                          parentIsReply: true,
                          depth: depth + 1,
                          data: (comments: null, replies: replies),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Color _getThreadLineColor(int depth, CommentCellStyle defaultStyle) {
  switch (depth) {
    case 0:
      return defaultStyle.threadLineColor1;
    case 1:
      return defaultStyle.threadLineColor2;
    case 2:
      return defaultStyle.threadLineColor3;
    case 3:
      return defaultStyle.threadLineColor4;
    case 4:
      return defaultStyle.threadLineColor5;
    default:
      return defaultStyle.threadLineColor1;
  }
}
