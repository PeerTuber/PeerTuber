import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comment.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comment_cell.dart';

typedef CommentsData = ({
  List<CommentEntity>? comments,
  List<CommentReplyEntity>? replies
});

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
    required this.isThread,
    this.parent,
    required this.data,
    this.navKey,
    this.contentId,
    this.parentIsReply = false,
    this.depth = 0,
  });

  final bool isThread;
  final bool parentIsReply;
  final CommentEntity? parent;
  final GlobalKey<NavigatorState>? navKey;
  final int? contentId;
  final CommentsData data;
  final int depth;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount:
          isThread ? data.replies!.length + 1 : data.comments!.length + 1,
      itemBuilder: (BuildContext conext, int index) {
        if (index == 0) {
          if (parent == null) return const SizedBox.shrink();

          //!-- PARENT COMMENT
          return Visibility(
            visible: isThread,
            child: CommentWidget(
              isInThread: true,
              comment: parent!,
              data: (comments: null, replies: null),
            ),
          );
        } else {
          //!-- CHILD COMMENT
          return CommentCell(
            hasReplyLine: isThread ? true : false,
            hasRightPadding: parentIsReply ? false : true,
            depth: depth,
            replyIndex: index,
            index: index,
            isThread: isThread,
            navKey: navKey,
            contentId: contentId,
            data: data,
          );
        }
      },
      separatorBuilder: (_, __) => const SizedBox.shrink(),
      padding: EdgeInsets.zero,
    );
  }
}
