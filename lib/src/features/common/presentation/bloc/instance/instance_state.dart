part of 'instance_cubit.dart';

sealed class InstanceState extends Equatable {
  const InstanceState();

  @override
  List<Object> get props => [];
}

final class InstanceInitial extends InstanceState {
  final InstanceEntity instance;

  const InstanceInitial({required this.instance});

  @override
  List<Object> get props => [instance];
}
