part of 'comments_cubit.dart';

sealed class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

final class CommentsInitial extends CommentsState {}

final class CommentsLoading extends CommentsState {}

final class CommentsLoaded extends CommentsState {
  final List<CommentEntity> comments;

  const CommentsLoaded({required this.comments});

  @override
  List<Object> get props => [comments];
}

final class CommentsError extends CommentsState {
  final String message;

  const CommentsError({required this.message});

  @override
  List<Object> get props => [message];
}
