import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comment.dart';

class CommentsPreview extends StatelessWidget {
  const CommentsPreview({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const CommentWidget(
          isSoloComment: true,
        ),
      ),
    );
  }
}
