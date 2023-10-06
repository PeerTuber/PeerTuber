import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/presentation/styles/comment_cell_style.dart';

class CommentCell extends StatelessWidget {
  const CommentCell({
    super.key,
    required this.child,
    this.style,
    this.hasReplyLine = false,
    this.hasRightPadding = true,
    this.depth = 0,
    this.replyIndex = 0,
  });

  final Widget child;
  final CommentCellStyle? style;
  final bool hasReplyLine;
  final bool hasRightPadding;
  final int depth;
  final int replyIndex;

  @override
  Widget build(BuildContext context) {
    CommentCellStyle defaultStyle =
        Theme.of(context).extension<CommentCellStyle>()!;

    return Container(
      color: const Color.fromARGB(255, 32, 32, 34),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            style?.threadLineSpacing ?? defaultStyle.threadLineSpacing,
            replyIndex > 0 ? 10 : 0,
            hasRightPadding ? 5 : 0,
            0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: hasReplyLine
                    ? style?.threadLineColor1 ??
                        _getThreadLineColor(depth, defaultStyle)
                    : Colors.transparent,
                width: 3,
              ),
              top: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 0.2,
              ),
            ),
          ),
          child: child,
        ),
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
