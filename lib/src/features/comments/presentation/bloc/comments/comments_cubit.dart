import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peertuber/src/features/comments/domain/entities/comment.dart';
import 'package:peertuber/src/features/comments/domain/usecases/get_comment_threads.dart';
import 'package:peertuber/src/features/common/domain/usecases/usecase.dart';

part 'comments_state.dart';

@injectable
class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit({required this.getCommentThread}) : super(CommentsInitial());

  final GetCommentThreadUseCase getCommentThread;

  void getComments({required int videoId}) async {
    emit(CommentsLoading());
    final comments = await getCommentThread(CommentParams(videoId: videoId));

    comments.fold(
      (failure) => emit(const CommentsError(message: 'There was an error')),
      (commentList) => emit(CommentsLoaded(comments: commentList)),
    );
  }
}
