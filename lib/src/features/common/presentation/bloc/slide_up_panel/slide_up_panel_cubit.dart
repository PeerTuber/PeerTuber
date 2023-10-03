import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

part 'slide_up_panel_state.dart';

@injectable
class SlideUpPanelCubit extends Cubit<SlideUpPanelState> {
  SlideUpPanelCubit({required this.panelController})
      : super(SlideUpPanelInitial());

  final PanelController panelController;

  void openPanel() {
    panelController.open();
    emit(SlideUpPanelOpened());
  }

  void closePanel() {
    panelController.close();
    emit(SlideUpPanelClosed());
  }
}
