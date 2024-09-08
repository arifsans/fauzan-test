part of 'sliding_panel_bloc.dart';

@freezed
class SlidingPanelState with _$SlidingPanelState {
  const factory SlidingPanelState.loaded({required bool isOpen}) = _Loaded;

  factory SlidingPanelState.defaultState() {
    return const SlidingPanelState.loaded(isOpen: false);
  }
}
