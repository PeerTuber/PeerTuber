import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment_reply.dart';
import 'package:peertuber/src/features/comments/domain/usecases/get_comment_replies.dart';
import 'package:peertuber/src/features/comments/domain/usecases/get_comment_threads.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

part 'comments_state.dart';

@injectable
class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(
      {required this.getCommentThread, required this.getCommentReplies})
      : super(CommentsInitial());

  final GetCommentThreadUseCase getCommentThread;
  final GetCommentRepliesUseCase getCommentReplies;

  void getComments({
    required int videoId,
    required Key requesterKey,
    String? videoUrl,
  }) async {
    emit(CommentsLoading());
    final comments = await getCommentThread(
        CommentParams(videoId: videoId, videoUrl: videoUrl));

    comments.fold(
      (failure) => emit(const CommentsError(message: 'There was an error')),
      (commentList) => emit(
          CommentsLoaded(comments: commentList, requesterKey: requesterKey)),
    );
  }

  void getReplies(
      {required int videoId,
      required int threadId,
      required Key requesterKey,
      String? videoUrl}) async {
    emit(CommentsLoading());
    final comments = await getCommentReplies(CommentParams(
        videoId: videoId, threadId: threadId, videoUrl: videoUrl));

    comments.fold(
      (failure) => emit(const CommentsError(message: 'There was an error')),
      (repliesList) => emit(
          CommentsLoaded(replies: repliesList, requesterKey: requesterKey)),
    );
  }
}
