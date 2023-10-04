import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/presentation/screens/comment_screen.dart';

class CommentsNavigation extends StatelessWidget {
  CommentsNavigation({super.key, required this.videoId});

  final int videoId;
  final _commentsScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _commentsScreen,
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) => CommentsScreen(
            key: UniqueKey(),
            navKey: _commentsScreen,
            isThread: false,
            contentId: videoId,
          ),
        ),
      ),
    );
  }
}
