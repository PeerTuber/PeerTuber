import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/presentation/screens/comment_screen.dart';

class CommentsNavigation extends StatelessWidget {
  CommentsNavigation({super.key, required this.videoId, this.videoUrl});

  final int videoId;
  final String? videoUrl;
  final _commentsScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 34),
      body: Navigator(
        key: _commentsScreen,
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) => CommentsScreen(
            key: UniqueKey(),
            navKey: _commentsScreen,
            isThread: false,
            contentId: videoId,
            videoUrl: videoUrl,
          ),
        ),
      ),
    );
  }
}
