import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'tb_anak.dart';
import 'tb_pengukuran.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationCacheDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase(file);
  });
}


@DriftDatabase(tables: [Anak, Pengukuran])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  Future<List<AnakData>> getAllAnak() async {
    return select(anak).get();
  }

  Future<void> deleteAllAnak() async {
    await delete(anak).go();
  }
  

  Future<int> deleteAllPengukuran(int idAnak) {
    return (delete(pengukuran)..where((tbl) => tbl.id_anak.equals(idAnak))).go();
  }

Future<int> deletePengukuran(int idPengukuran) {
    return (delete(pengukuran)
          ..where((tbl) => tbl.id_pengukuran.equals(idPengukuran)))
        .go();
  }

//   Future<int> deleteWhere(Expression<bool> Function(Tbl tbl) filter) {
//   return (delete(pengukuran)..where(filter)).go();
// }

  Future<DateTime?> getTanggalLahir(int idAnak) async {
    final query = select(anak)..where((tbl) => tbl.id_anak.equals(idAnak));
    final result = await query.getSingleOrNull();

    return result?.tgl_lahir;
  }

  Future<List<PengukuranData>> getPengukuranAnak(int idAnak) async {
    final query = select(pengukuran)..where((pengukuran) => pengukuran.id_anak.equals(idAnak));
    return await query.get();
  }

  Future<String?> getNamaAnak(int idAnak) async {
    final query = select(anak)..where((tbl) => tbl.id_anak.equals(idAnak));
    final result = await query.getSingleOrNull();

    return result?.nama_anak;
  }
}
