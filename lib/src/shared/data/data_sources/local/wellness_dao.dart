import 'package:fauzan_test/src/shared/domain/models/wellness.dart';
import 'package:floor/floor.dart';

@dao
abstract class WellnessDAO {
  @insert
  Future<List<int>> insertWellness(List<Wellness> wellness);

  @Query('SELECT * FROM Wellness')
  Future<List<Wellness>> getWellness();

  @Query('DELETE FROM Wellness WHERE id = :id')
  Future<Wellness?> deleteWellness(int id);

  @Query('SELECT * FROM Wellness ORDER BY harga ASC')
  Future<List<Wellness>> getWellnessByHargaTermurah();

  @Query('SELECT * FROM Wellness ORDER BY harga DESC')
  Future<List<Wellness>> getWellnessByHargaTermahal();

  @Query(
    'SELECT * FROM Wellness ORDER BY substr(judul, 1, 1) COLLATE NOCASE ASC',
  )
  Future<List<Wellness>> getWellnessByJudulAtoZ();

  @Query(
    'SELECT * FROM Wellness ORDER BY substr(judul, 1, 1) COLLATE NOCASE DESC',
  )
  Future<List<Wellness>> getWellnessByJudulZtoA();
}
