import 'dart:async';

import 'package:fauzan_test/src/shared/data/data_sources/local/wellness_dao.dart';
import 'package:fauzan_test/src/shared/domain/models/wellness.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'wellness_database.g.dart';

@Database(version: 1, entities: [Wellness])
abstract class WellnessDatabase extends FloorDatabase {
  WellnessDAO get wellnessDAO;
}
