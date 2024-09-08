import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_state.dart';
part 'stepper_event.dart';
part 'stepper_bloc.freezed.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  StepperBloc() : super(const StepperState.loaded(index: 1)) {
    on<StepperEvent>(
      (event, emit) {
        event.map(
          updateStep: (param) {
            emit(StepperState.loaded(index: param.index));
          },
        );
      },
    );
  }
}
