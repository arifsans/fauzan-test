import 'package:fauzan_test/src/shared/domain/models/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDAO {
  @insert
  Future<List<int>> insertUser(List<User> users);

  @Query('SELECT * FROM User')
  Future<List<User>> getUser();

  @Query('DELETE FROM User WHERE id = :id')
  Future<User?> deleteUser(int id);

  @update
  Future<int> updateUser(User user);
}
