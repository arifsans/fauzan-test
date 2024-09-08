import 'dart:async';

import 'package:fauzan_test/src/shared/data/data_sources/local/user_dao.dart';
import 'package:fauzan_test/src/shared/domain/models/user.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'user_database.g.dart';

@Database(version: 1, entities: [User])
abstract class UserDatabase extends FloorDatabase {
  UserDAO get userDAO;
}
