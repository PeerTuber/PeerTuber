import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/presentation/bloc/comments/comments_cubit.dart';
import 'package:peertuber/src/features/comments/presentation/widgets/comments_list.dart';
import 'package:peertuber/src/features/common/presentation/bloc/slide_up_panel/slide_up_panel_cubit.dart';

class CommentsScreen extends HookWidget {
  const CommentsScreen({
    super.key,
    required this.navKey,
    required this.isThread,
    required this.contentId,
    this.parent = CommentEntity.empty,
  });

  final GlobalKey<NavigatorState>? navKey;
  final bool isThread;
  final int contentId;
  final CommentEntity? parent;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (!isThread) {
        context
            .read<CommentsCubit>()
            .getComments(videoId: contentId, requesterKey: key!);
      } else {
        context.read<CommentsCubit>().getReplies(
            videoId: contentId, threadId: parent!.id, requesterKey: key!);
      }

      return;
    }, []);

    return BlocListener<SlideUpPanelCubit, SlideUpPanelState>(
      listener: (context, state) {
        if (state is SlideUpPanelClosed) {
          if (isThread) navKey!.currentState?.pop();
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: isThread,
                  child: IconButton(
                      onPressed: () {
                        navKey!.currentState?.pop();
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
          BlocBuilder<CommentsCubit, CommentsState>(
            buildWhen: (previous, current) {
              if (current is CommentsLoaded) {
                return (current.requesterKey == key);
              }

              return false;
            },
            builder: (context, state) {
              if (state is CommentsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CommentsError) {
                return const Center(
                  child: Text('There was an error loading comments'),
                );
              }

              //!-- LIST VIEW
              return Visibility(
                visible: (state is CommentsLoaded),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: CommentsList(
                      isThread: isThread,
                      parent: parent,
                      navKey: navKey,
                      contentId: contentId,
                      data: (
                        comments: (state as CommentsLoaded).comments,
                        replies: (state as CommentsLoaded).replies
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
