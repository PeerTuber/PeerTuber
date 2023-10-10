import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class CommentCellStyle extends ThemeExtension<CommentCellStyle> {
  const CommentCellStyle({
    required this.threadLineColor1,
    required this.threadLineColor2,
    required this.threadLineColor3,
    required this.threadLineColor4,
    required this.threadLineColor5,
    required this.threadLineSpacing,
    required this.cellTopBorder,
  });

  // Thread line colors
  final Color threadLineColor1;
  final Color threadLineColor2;
  final Color threadLineColor3;
  final Color threadLineColor4;
  final Color threadLineColor5;

  final BorderSide cellTopBorder;

  // Thread line spacing
  final double threadLineSpacing;

  @override
  CommentCellStyle copyWith({
    Color? threadLineColor1,
    Color? threadLineColor2,
    Color? threadLineColor3,
    Color? threadLineColor4,
    Color? threadLineColor5,
    double? threadLineSpacing,
    BorderSide? cellTopBorder,
  }) =>
      CommentCellStyle(
        threadLineColor1: threadLineColor1 ?? this.threadLineColor1,
        threadLineColor2: threadLineColor2 ?? this.threadLineColor2,
        threadLineColor3: threadLineColor3 ?? this.threadLineColor3,
        threadLineColor4: threadLineColor4 ?? this.threadLineColor4,
        threadLineColor5: threadLineColor5 ?? this.threadLineColor5,
        threadLineSpacing: threadLineSpacing ?? this.threadLineSpacing,
        cellTopBorder: cellTopBorder ?? this.cellTopBorder,
      );

  @override
  ThemeExtension<CommentCellStyle> lerp(
      covariant ThemeExtension<CommentCellStyle>? other, double t) {
    if (other is! CommentCellStyle) return this;

    return CommentCellStyle(
      threadLineColor1:
          Color.lerp(threadLineColor1, other.threadLineColor1, t)!,
      threadLineColor2:
          Color.lerp(threadLineColor2, other.threadLineColor2, t)!,
      threadLineColor3:
          Color.lerp(threadLineColor3, other.threadLineColor3, t)!,
      threadLineColor4:
          Color.lerp(threadLineColor4, other.threadLineColor4, t)!,
      threadLineColor5:
          Color.lerp(threadLineColor5, other.threadLineColor5, t)!,
      threadLineSpacing:
          lerpDouble(threadLineSpacing, other.threadLineSpacing, t)!,
      cellTopBorder: BorderSide.lerp(cellTopBorder, other.cellTopBorder, t),
    );
  }
}
