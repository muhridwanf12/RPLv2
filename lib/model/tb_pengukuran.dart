
import 'package:drift/drift.dart';

// part 'database.g.dart';


class Pengukuran extends Table {
  IntColumn get id_pengukuran => integer().autoIncrement()();
  IntColumn get id_anak => integer()();
  DateTimeColumn get tgl_pengukuran => dateTime()();
  TextColumn get edema => text().withLength(min : 2, max: 5)();
  IntColumn get usia => integer()();
  RealColumn get tb => real()();
  RealColumn get bb => real()();
  RealColumn get imtu => real().nullable()();
  RealColumn get tbbb => real().nullable()();
  RealColumn get tbu => real().nullable()();
  RealColumn get bbu => real().nullable()();
}
