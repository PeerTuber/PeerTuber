import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peertuber/src/features/comments/presentation/bloc/comments/comments_cubit.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comment.dart';
import 'package:peertuber/src/features/common/presentation/bloc/slide_up_panel/slide_up_panel_cubit.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key, required this.videoId});

  final int videoId;

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
            contentId: widget.videoId,
          ),
        ),
      ),
    );
  }
}

class CommentsList extends HookWidget {
  const CommentsList(
      {super.key,
      required this.navKey,
      required this.isThread,
      required this.contentId});

  final GlobalKey<NavigatorState> navKey;
  final bool isThread;
  final int contentId;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (!isThread) {
        context.read<CommentsCubit>().getComments(videoId: contentId);
      }

      return;
    }, []);

    return BlocListener<SlideUpPanelCubit, SlideUpPanelState>(
      listener: (context, state) {
        if (state is SlideUpPanelClosed) {
          if (isThread) navKey.currentState?.pop();
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: isThread,
                    child: IconButton(
                        onPressed: () {
                          navKey.currentState?.pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                  ),
                  Visibility(
                    visible: !isThread,
                    child: const Text('Comments'),
                  ),
                  Visibility(
                    visible: isThread,
                    child: const Text('Replies'),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        context.read<SlideUpPanelCubit>().closePanel();
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
            ),
          ),
          BlocBuilder<CommentsCubit, CommentsState>(
            builder: (context, state) {
              if (state is CommentsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Visibility(
                visible: (state is CommentsLoaded),
                child: Expanded(
                  child: ListView.builder(
                      itemCount: (state as CommentsLoaded).comments.length + 1,
                      itemBuilder: (BuildContext conext, int index) {
                        if (index == 0) {
                          return Visibility(
                            visible: isThread,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              if (isThread) return;

                              navKey.currentState?.push<void>(
                                  MaterialPageRoute(builder: (context) {
                                return CommentsList(
                                  navKey: navKey,
                                  isThread: true,
                                  contentId: 0,
                                );
                              }));
                            },
                            child: Container(
                              color: isThread
                                  ? const Color.fromRGBO(40, 40, 40, 1)
                                  : Colors.transparent,
                              child: CommentWidget(
                                comment: state.comments[index - 1],
                                isInThread: isThread,
                              ),
                            ),
                          );
                        }
                      }),
                ),

                /*Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: isThread,
                              child: IconButton(
                                  onPressed: () {
                                    navKey.currentState?.pop();
                                  },
                                  icon: const Icon(Icons.arrow_back_ios)),
                            ),
                            Visibility(
                              visible: !isThread,
                              child: const Text('Comments'),
                            ),
                            Visibility(
                              visible: isThread,
                              child: const Text('Replies'),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  context.read<SlideUpPanelCubit>().closePanel();
                                },
                                icon: const Icon(Icons.close)),
                          ],
                        ),
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
                            contentId: 0,
                          );
                        }));
                      },
                      child: Container(
                        color: isThread
                            ? const Color.fromRGBO(40, 40, 40, 1)
                            : Colors.transparent,
                        child: CommentWidget(
                          isInThread: isThread,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isThread,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          children: [
                            CommentWidget(
                              isInThread: isThread,
                            ),
                            CommentWidget(
                              isInThread: isThread,
                            ),
                            CommentWidget(
                              isInThread: isThread,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),*/
              );
            },
          ),
        ],
      ),
    );
  }
}
