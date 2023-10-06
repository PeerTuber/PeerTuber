import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';
import 'package:peertuber/src/features/comments/presentation/screens/comment_screen.dart';
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
              child: CommentCell(
                child: CommentWidget(
                  comment: parent!,
                  isInThread: isThread,
                  data: (comments: null, replies: null),
                ),
              ));
        } else {
          //!-- CHILD COMMENT
          return CommentCell(
            hasReplyLine: isThread ? true : false,
            hasRightPadding: parentIsReply ? false : true,
            depth: depth,
            replyIndex: index,
            child: CommentWrapper(
              index: index,
              isThread: isThread,
              navKey: navKey,
              contentId: contentId,
              data: data,
              depth: depth,
            ),
          );
        }
      },
      separatorBuilder: (_, __) => const SizedBox.shrink(),
      padding: EdgeInsets.zero,
    );
  }
}

//!-- COMMENT WRAPPER

class CommentWrapper extends StatelessWidget {
  const CommentWrapper({
    super.key,
    required this.index,
    required this.isThread,
    required this.navKey,
    required this.contentId,
    required this.data,
    this.depth = 0,
  });

  final int index;
  final bool isThread;
  final GlobalKey<NavigatorState>? navKey;
  final int? contentId;
  final CommentsData data;
  final int depth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Don't allow the gesture to be triggered if this is a thread
        if (isThread) return;

        // Don't allow the gesture to be triggered if there are no replies
        if (data.comments![index - 1].totalReplies == 0) return;

        navKey?.currentState?.push<void>(MaterialPageRoute(builder: (context) {
          return CommentsScreen(
            key: UniqueKey(),
            navKey: navKey,
            isThread: true,
            contentId: contentId!,
            parent: data.comments![index - 1],
          );
        }));
      },
      child: CommentWidget(
        depth: depth,
        comment: isThread
            ? data.replies![index - 1].comment
            : data.comments![index - 1],
        isInThread: isThread,
        data: (
          comments: null,
          replies: isThread ? data.replies![index - 1].children : null
        ),
      ),
    );
  }
}
