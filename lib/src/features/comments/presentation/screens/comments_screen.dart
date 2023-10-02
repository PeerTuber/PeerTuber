import 'package:flutter/material.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comment.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final _commentsScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _commentsScreen,
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) => CommentsList(
            navKey: _commentsScreen,
            isThread: false,
          ),
        ),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.navKey, required this.isThread});

  final GlobalKey<NavigatorState> navKey;
  final bool isThread;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !isThread
            ? const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('COMMENTS:'),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          navKey.currentState?.pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text('Replies'),
                  ],
                ),
              ),
        GestureDetector(
          onTap: () {
            if (isThread) return;

            navKey.currentState
                ?.push<void>(MaterialPageRoute(builder: (context) {
              return CommentsList(
                navKey: navKey,
                isThread: true,
              );
            }));
          },
          child: const CommentWidget(),
        ),
      ],
    );
  }
}
