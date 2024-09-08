import 'package:fauzan_test/src/shared/data/data_sources/local/user_database.dart';
import 'package:fauzan_test/src/shared/domain/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'user_state.dart';
part 'user_event.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserDatabase database = GetIt.I<UserDatabase>();

  UserBloc() : super(const UserState.initial()) {
    on<UserEvent>(
      (event, emit) async {
        await event.map(
          checkAndInsertInitialData: (param) async {
            await _onCheckAndInsertInitialData(event, emit);
          },
          getUserData: (param) async {
            await _onGetUserData(event, emit);
          },
          updateUserData: (param) async {
            await _onUpdateUserData(param.user, emit);
          },
        );
      },
    );
  }

  ///Check user database and insert data if database is empty
  Future<void> _onCheckAndInsertInitialData(
    UserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    try {
      final dao = database.userDAO;
      var userList = await dao.getUser();

      if (userList.isEmpty) {
        final List<User> initialData = [
          User(
            nama: 'Pelanggan',
            tglLahir: '1998-09-10',
            jenisKelamin: 'Laki-laki',
            email: 'pelanggan@email.com',
            noHp: '082123145432',
          ),
        ];

        await dao.insertUser(initialData).then((value) async {
          userList = await dao.getUser();

          emit(const UserState.loaded());
        });
      } else {
        emit(const UserState.loaded());
      }
    } catch (e) {
      emit(UserState.error(message: 'Failed to insert initial data: $e'));
    }
  }

  ///Get wellness data from database
  Future<void> _onGetUserData(
    UserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    try {
      final dao = database.userDAO;
      final userList = await dao.getUser();

      if (userList.isNotEmpty) {
        emit(UserState.dataLoaded(
          userData: userList.first,
        ));
      } else {
        emit(const UserState.error(message: 'Data is empty'));
      }
    } catch (e) {
      emit(UserState.error(message: 'Failed to get data: $e'));
    }
  }

  //Get wellness data from database
  Future<void> _onUpdateUserData(
    User user,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    try {
      final dao = database.userDAO;
      await dao.updateUser(user);
      emit(const UserState.successUpdate());
    } catch (e) {
      emit(UserState.error(message: 'Failed to get data: $e'));
    }
  }
}
