import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_state.dart';
part 'bottom_nav_event.dart';
part 'bottom_nav_bloc.freezed.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState.loaded(index: 0)) {
    on<BottomNavEvent>(
      (event, emit) {
        event.map(
          changeIndex: (param) {
            emit(BottomNavState.loaded(index: param.index));
          },
        );
      },
    );
  }
}
