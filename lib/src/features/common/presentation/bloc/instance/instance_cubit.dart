import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peertuber/src/features/common/domain/entities/instance.dart';
import 'package:injectable/injectable.dart';

part 'instance_state.dart';

@injectable
class InstanceCubit extends Cubit<InstanceInitial> {
  InstanceCubit()
      : super(InstanceInitial(
            instance: InstanceEntity(host: 'https://vids.neovibe.app')));

  void updateInstance(InstanceEntity instance) {
    emit(InstanceInitial(instance: instance));
  }
}
