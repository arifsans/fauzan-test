// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorWellnessDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WellnessDatabaseBuilder databaseBuilder(String name) =>
      _$WellnessDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WellnessDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$WellnessDatabaseBuilder(null);
}

class _$WellnessDatabaseBuilder {
  _$WellnessDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$WellnessDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WellnessDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WellnessDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WellnessDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WellnessDatabase extends WellnessDatabase {
  _$WellnessDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WellnessDAO? _wellnessDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Wellness` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `gambar` TEXT NOT NULL, `judul` TEXT NOT NULL, `tipe` TEXT NOT NULL, `urlShare` TEXT NOT NULL, `deskripsi` TEXT NOT NULL, `harga` INTEGER NOT NULL, `minQty` INTEGER NOT NULL, `maxQty` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WellnessDAO get wellnessDAO {
    return _wellnessDAOInstance ??= _$WellnessDAO(database, changeListener);
  }
}

class _$WellnessDAO extends WellnessDAO {
  _$WellnessDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _wellnessInsertionAdapter = InsertionAdapter(
            database,
            'Wellness',
            (Wellness item) => <String, Object?>{
                  'id': item.id,
                  'gambar': item.gambar,
                  'judul': item.judul,
                  'tipe': item.tipe,
                  'urlShare': item.urlShare,
                  'deskripsi': item.deskripsi,
                  'harga': item.harga,
                  'minQty': item.minQty,
                  'maxQty': item.maxQty
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Wellness> _wellnessInsertionAdapter;

  @override
  Future<List<Wellness>> getWellness() async {
    return _queryAdapter.queryList('SELECT * FROM Wellness',
        mapper: (Map<String, Object?> row) => Wellness(
            id: row['id'] as int?,
            gambar: row['gambar'] as String,
            judul: row['judul'] as String,
            tipe: row['tipe'] as String,
            urlShare: row['urlShare'] as String,
            deskripsi: row['deskripsi'] as String,
            harga: row['harga'] as int,
            minQty: row['minQty'] as int,
            maxQty: row['maxQty'] as int));
  }

  @override
  Future<Wellness?> deleteWellness(int id) async {
    return _queryAdapter.query('DELETE FROM Wellness WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Wellness(
            id: row['id'] as int?,
            gambar: row['gambar'] as String,
            judul: row['judul'] as String,
            tipe: row['tipe'] as String,
            urlShare: row['urlShare'] as String,
            deskripsi: row['deskripsi'] as String,
            harga: row['harga'] as int,
            minQty: row['minQty'] as int,
            maxQty: row['maxQty'] as int),
        arguments: [id]);
  }

  @override
  Future<List<Wellness>> getWellnessByHargaTermurah() async {
    return _queryAdapter.queryList('SELECT * FROM Wellness ORDER BY harga ASC',
        mapper: (Map<String, Object?> row) => Wellness(
            id: row['id'] as int?,
            gambar: row['gambar'] as String,
            judul: row['judul'] as String,
            tipe: row['tipe'] as String,
            urlShare: row['urlShare'] as String,
            deskripsi: row['deskripsi'] as String,
            harga: row['harga'] as int,
            minQty: row['minQty'] as int,
            maxQty: row['maxQty'] as int));
  }

  @override
  Future<List<Wellness>> getWellnessByHargaTermahal() async {
    return _queryAdapter.queryList('SELECT * FROM Wellness ORDER BY harga DESC',
        mapper: (Map<String, Object?> row) => Wellness(
            id: row['id'] as int?,
            gambar: row['gambar'] as String,
            judul: row['judul'] as String,
            tipe: row['tipe'] as String,
            urlShare: row['urlShare'] as String,
            deskripsi: row['deskripsi'] as String,
            harga: row['harga'] as int,
            minQty: row['minQty'] as int,
            maxQty: row['maxQty'] as int));
  }

  @override
  Future<List<Wellness>> getWellnessByJudulAtoZ() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Wellness ORDER BY substr(judul, 1, 1) COLLATE NOCASE ASC',
        mapper: (Map<String, Object?> row) => Wellness(
            id: row['id'] as int?,
            gambar: row['gambar'] as String,
            judul: row['judul'] as String,
            tipe: row['tipe'] as String,
            urlShare: row['urlShare'] as String,
            deskripsi: row['deskripsi'] as String,
            harga: row['harga'] as int,
            minQty: row['minQty'] as int,
            maxQty: row['maxQty'] as int));
  }

  @override
  Future<List<Wellness>> getWellnessByJudulZtoA() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Wellness ORDER BY substr(judul, 1, 1) COLLATE NOCASE DESC',
        mapper: (Map<String, Object?> row) => Wellness(
            id: row['id'] as int?,
            gambar: row['gambar'] as String,
            judul: row['judul'] as String,
            tipe: row['tipe'] as String,
            urlShare: row['urlShare'] as String,
            deskripsi: row['deskripsi'] as String,
            harga: row['harga'] as int,
            minQty: row['minQty'] as int,
            maxQty: row['maxQty'] as int));
  }

  @override
  Future<List<int>> insertWellness(List<Wellness> wellness) {
    return _wellnessInsertionAdapter.insertListAndReturnIds(
        wellness, OnConflictStrategy.abort);
  }
}
