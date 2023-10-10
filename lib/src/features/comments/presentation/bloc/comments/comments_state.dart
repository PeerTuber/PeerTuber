part of 'comments_cubit.dart';

sealed class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

final class CommentsInitial extends CommentsState {}

final class CommentsLoading extends CommentsState {}

final class CommentsLoaded extends CommentsState {
  final List<CommentEntity>? comments;
  final List<CommentReplyEntity>? replies;
  final Key requesterKey;

  const CommentsLoaded(
      {this.comments, this.replies, required this.requesterKey});

  @override
  List<Object> get props => [requesterKey];
}

final class CommentsError extends CommentsState {
  final String message;

  const CommentsError({required this.message});

  @override
  List<Object> get props => [message];
}
