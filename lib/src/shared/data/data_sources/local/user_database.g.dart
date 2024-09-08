// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorUserDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder databaseBuilder(String name) =>
      _$UserDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$UserDatabaseBuilder(null);
}

class _$UserDatabaseBuilder {
  _$UserDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$UserDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$UserDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<UserDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDatabase extends UserDatabase {
  _$UserDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDAO? _userDAOInstance;

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
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `nama` TEXT NOT NULL, `tglLahir` TEXT NOT NULL, `jenisKelamin` TEXT NOT NULL, `email` TEXT NOT NULL, `noHp` TEXT NOT NULL, `pendidikan` TEXT, `statusPernikahan` TEXT, `nik` TEXT, `alamat` TEXT, `provinsi` TEXT, `kota` TEXT, `kecamatan` TEXT, `kelurahan` TEXT, `kodePos` TEXT, `namaUsaha` TEXT, `alamatUsaha` TEXT, `jabatan` TEXT, `lamaBekerja` TEXT, `sumberPendapatan` TEXT, `pendapatanKotorPertahun` TEXT, `namaBank` TEXT, `cabangBank` TEXT, `namaPemilikRekening` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDAO get userDAO {
    return _userDAOInstance ??= _$UserDAO(database, changeListener);
  }
}

class _$UserDAO extends UserDAO {
  _$UserDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'nama': item.nama,
                  'tglLahir': item.tglLahir,
                  'jenisKelamin': item.jenisKelamin,
                  'email': item.email,
                  'noHp': item.noHp,
                  'pendidikan': item.pendidikan,
                  'statusPernikahan': item.statusPernikahan,
                  'nik': item.nik,
                  'alamat': item.alamat,
                  'provinsi': item.provinsi,
                  'kota': item.kota,
                  'kecamatan': item.kecamatan,
                  'kelurahan': item.kelurahan,
                  'kodePos': item.kodePos,
                  'namaUsaha': item.namaUsaha,
                  'alamatUsaha': item.alamatUsaha,
                  'jabatan': item.jabatan,
                  'lamaBekerja': item.lamaBekerja,
                  'sumberPendapatan': item.sumberPendapatan,
                  'pendapatanKotorPertahun': item.pendapatanKotorPertahun,
                  'namaBank': item.namaBank,
                  'cabangBank': item.cabangBank,
                  'namaPemilikRekening': item.namaPemilikRekening
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'nama': item.nama,
                  'tglLahir': item.tglLahir,
                  'jenisKelamin': item.jenisKelamin,
                  'email': item.email,
                  'noHp': item.noHp,
                  'pendidikan': item.pendidikan,
                  'statusPernikahan': item.statusPernikahan,
                  'nik': item.nik,
                  'alamat': item.alamat,
                  'provinsi': item.provinsi,
                  'kota': item.kota,
                  'kecamatan': item.kecamatan,
                  'kelurahan': item.kelurahan,
                  'kodePos': item.kodePos,
                  'namaUsaha': item.namaUsaha,
                  'alamatUsaha': item.alamatUsaha,
                  'jabatan': item.jabatan,
                  'lamaBekerja': item.lamaBekerja,
                  'sumberPendapatan': item.sumberPendapatan,
                  'pendapatanKotorPertahun': item.pendapatanKotorPertahun,
                  'namaBank': item.namaBank,
                  'cabangBank': item.cabangBank,
                  'namaPemilikRekening': item.namaPemilikRekening
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  @override
  Future<List<User>> getUser() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            nama: row['nama'] as String,
            tglLahir: row['tglLahir'] as String,
            jenisKelamin: row['jenisKelamin'] as String,
            email: row['email'] as String,
            noHp: row['noHp'] as String,
            pendidikan: row['pendidikan'] as String?,
            statusPernikahan: row['statusPernikahan'] as String?,
            nik: row['nik'] as String?,
            alamat: row['alamat'] as String?,
            provinsi: row['provinsi'] as String?,
            kota: row['kota'] as String?,
            kecamatan: row['kecamatan'] as String?,
            kelurahan: row['kelurahan'] as String?,
            kodePos: row['kodePos'] as String?,
            namaUsaha: row['namaUsaha'] as String?,
            alamatUsaha: row['alamatUsaha'] as String?,
            jabatan: row['jabatan'] as String?,
            lamaBekerja: row['lamaBekerja'] as String?,
            sumberPendapatan: row['sumberPendapatan'] as String?,
            pendapatanKotorPertahun: row['pendapatanKotorPertahun'] as String?,
            namaBank: row['namaBank'] as String?,
            cabangBank: row['cabangBank'] as String?,
            namaPemilikRekening: row['namaPemilikRekening'] as String?));
  }

  @override
  Future<User?> deleteUser(int id) async {
    return _queryAdapter.query('DELETE FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            nama: row['nama'] as String,
            tglLahir: row['tglLahir'] as String,
            jenisKelamin: row['jenisKelamin'] as String,
            email: row['email'] as String,
            noHp: row['noHp'] as String,
            pendidikan: row['pendidikan'] as String?,
            statusPernikahan: row['statusPernikahan'] as String?,
            nik: row['nik'] as String?,
            alamat: row['alamat'] as String?,
            provinsi: row['provinsi'] as String?,
            kota: row['kota'] as String?,
            kecamatan: row['kecamatan'] as String?,
            kelurahan: row['kelurahan'] as String?,
            kodePos: row['kodePos'] as String?,
            namaUsaha: row['namaUsaha'] as String?,
            alamatUsaha: row['alamatUsaha'] as String?,
            jabatan: row['jabatan'] as String?,
            lamaBekerja: row['lamaBekerja'] as String?,
            sumberPendapatan: row['sumberPendapatan'] as String?,
            pendapatanKotorPertahun: row['pendapatanKotorPertahun'] as String?,
            namaBank: row['namaBank'] as String?,
            cabangBank: row['cabangBank'] as String?,
            namaPemilikRekening: row['namaPemilikRekening'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<int>> insertUser(List<User> users) {
    return _userInsertionAdapter.insertListAndReturnIds(
        users, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateUser(User user) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        user, OnConflictStrategy.abort);
  }
}
