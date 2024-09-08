import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sliding_panel_state.dart';
part 'sliding_panel_event.dart';
part 'sliding_panel_bloc.freezed.dart';

class SlidingPanelBloc extends Bloc<SlidingPanelEvent, SlidingPanelState> {
  SlidingPanelBloc() : super(const SlidingPanelState.loaded(isOpen: false)) {
    on<SlidingPanelEvent>((event, emit) {
      event.map(
        update: (param) {
          emit(SlidingPanelState.loaded(isOpen: !param.isOpen));
        },
      );
    });
  }
}
