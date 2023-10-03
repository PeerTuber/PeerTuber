import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comment.dart';

class CommentsPreview extends StatelessWidget {
  const CommentsPreview({
    super.key,
    required this.comment,
    this.onTap,
  });

  final CommentEntity comment;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        /*decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),*/
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CommentWidget(
            comment: comment,
            isSoloComment: true,
            hasPadding: false,
          ),
        ),
      ),
    );
  }
}
