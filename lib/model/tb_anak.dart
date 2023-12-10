
import 'package:drift/drift.dart';

// part 'database.g.dart';



class Anak extends Table {
  IntColumn get id_anak => integer().autoIncrement()();
  TextColumn get nama_anak => text().withLength(min : 1, max: 50)();
  TextColumn get gender => text().withLength(min : 1, max: 50)();
  DateTimeColumn get tgl_lahir => dateTime()();
  TextColumn get nama_ayah => text().withLength(min : 1, max: 50)();
  TextColumn get nama_ibu => text().withLength(min : 1, max: 50)();
}
