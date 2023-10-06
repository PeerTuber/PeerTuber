import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peertuber/src/config/res/colors.dart';
import 'package:peertuber/src/features/comments/presentation/styles/comment_cell_style.dart';

class CustomTheme {
  //!-- Dark Theme
  ThemeData dark() {
    const backgroundColor = Color.fromRGBO(15, 15, 15, 1);
    final baseTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        background: backgroundColor,
        primary: AppColors.primary.shade800,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.notoSansTextTheme().headlineLarge!.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      dividerTheme: DividerThemeData(color: Colors.grey.shade800),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: baseTheme.colorScheme.background,
        selectedItemColor: baseTheme.colorScheme.primary,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: baseTheme.colorScheme.primary,
        linearTrackColor: baseTheme.colorScheme.primary.withOpacity(0.1),
        circularTrackColor: baseTheme.colorScheme.primary.withOpacity(0.1),
      ),
      extensions: <ThemeExtension<dynamic>>{
        CommentCellStyle(
          threadLineColor1: baseTheme.colorScheme.primary,
          threadLineColor2: AppColors.primary.shade700,
          threadLineColor3: AppColors.primary.shade600,
          threadLineColor4: AppColors.primary.shade500,
          threadLineColor5: AppColors.primary.shade400,
          threadLineSpacing: 8,
        )
      },
    );
  }

  //!-- Light Theme
  ThemeData light() {
    const backgroundColor = Color.fromRGBO(15, 15, 15, 1);
    final baseTheme = ThemeData(
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>{
        CommentCellStyle(
          threadLineColor1: Colors.orange.shade800,
          threadLineColor2: Colors.orange.shade700,
          threadLineColor3: Colors.orange.shade600,
          threadLineColor4: Colors.orange.shade500,
          threadLineColor5: Colors.orange.shade400,
          threadLineSpacing: 8,
        )
      },
      colorScheme: ColorScheme.light(
        background: backgroundColor,
        primary: Colors.orange.shade800,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.notoSansTextTheme().headlineLarge!.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      dividerTheme: DividerThemeData(color: Colors.grey.shade800),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: baseTheme.colorScheme.background,
        selectedItemColor: baseTheme.colorScheme.primary,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: baseTheme.colorScheme.primary,
        linearTrackColor: baseTheme.colorScheme.primary.withOpacity(0.1),
        circularTrackColor: baseTheme.colorScheme.primary.withOpacity(0.1),
      ),
    );
  }
}
