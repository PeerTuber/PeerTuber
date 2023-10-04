import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';
import 'package:peertuber/src/features/comments/presentation/screens/comment_screen.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comment.dart';

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
  });

  final bool isThread;
  final bool parentIsReply;
  final CommentEntity? parent;
  final GlobalKey<NavigatorState>? navKey;
  final int? contentId;
  final CommentsData data;

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
            child: CommentWrapper(
              index: index,
              isThread: isThread,
              navKey: navKey,
              contentId: contentId,
              data: data,
            ),
          );
        }
      },
      separatorBuilder: (_, __) => const SizedBox.shrink(),
      padding: EdgeInsets.zero,
    );
  }
}

//!-- COMMENT CELL

class CommentCell extends StatelessWidget {
  const CommentCell({
    super.key,
    required this.child,
    this.hasReplyLine = false,
    this.hasRightPadding = true,
  });

  final Widget child;
  final bool hasReplyLine;
  final bool hasRightPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 32, 32, 34),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, hasRightPadding ? 5 : 0, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: hasReplyLine
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                width: 3,
              ),
              top: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 0.2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0, 10.0),
            child: child,
          ),
        ),
      ),
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
  });

  final int index;
  final bool isThread;
  final GlobalKey<NavigatorState>? navKey;
  final int? contentId;
  final CommentsData data;

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
