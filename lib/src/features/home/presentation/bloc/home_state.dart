part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<VideoEntity> videoList;

  const HomeLoaded({this.videoList = const <VideoEntity>[]});

  @override
  List<Object> get props => [videoList];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}
