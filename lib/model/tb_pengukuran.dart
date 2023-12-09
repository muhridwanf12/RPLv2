
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
  RealColumn get imtu => real()();
  RealColumn get tbbb => real()();
  RealColumn get tbu => real()();
  RealColumn get bbu => real()();
  
}
