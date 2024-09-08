part of 'stepper_bloc.dart';

@freezed
class StepperState with _$StepperState {
  const factory StepperState.loaded({required int index}) = _Loaded;
}
