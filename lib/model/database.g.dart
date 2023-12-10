// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AnakTable extends Anak with TableInfo<$AnakTable, AnakData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnakTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _id_anakMeta =
      const VerificationMeta('id_anak');
  @override
  late final GeneratedColumn<int> id_anak = GeneratedColumn<int>(
      'id_anak', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nama_anakMeta =
      const VerificationMeta('nama_anak');
  @override
  late final GeneratedColumn<String> nama_anak = GeneratedColumn<String>(
      'nama_anak', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tgl_lahirMeta =
      const VerificationMeta('tgl_lahir');
  @override
  late final GeneratedColumn<DateTime> tgl_lahir = GeneratedColumn<DateTime>(
      'tgl_lahir', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nama_ayahMeta =
      const VerificationMeta('nama_ayah');
  @override
  late final GeneratedColumn<String> nama_ayah = GeneratedColumn<String>(
      'nama_ayah', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nama_ibuMeta =
      const VerificationMeta('nama_ibu');
  @override
  late final GeneratedColumn<String> nama_ibu = GeneratedColumn<String>(
      'nama_ibu', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id_anak, nama_anak, gender, tgl_lahir, nama_ayah, nama_ibu];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anak';
  @override
  VerificationContext validateIntegrity(Insertable<AnakData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_anak')) {
      context.handle(_id_anakMeta,
          id_anak.isAcceptableOrUnknown(data['id_anak']!, _id_anakMeta));
    }
    if (data.containsKey('nama_anak')) {
      context.handle(_nama_anakMeta,
          nama_anak.isAcceptableOrUnknown(data['nama_anak']!, _nama_anakMeta));
    } else if (isInserting) {
      context.missing(_nama_anakMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('tgl_lahir')) {
      context.handle(_tgl_lahirMeta,
          tgl_lahir.isAcceptableOrUnknown(data['tgl_lahir']!, _tgl_lahirMeta));
    } else if (isInserting) {
      context.missing(_tgl_lahirMeta);
    }
    if (data.containsKey('nama_ayah')) {
      context.handle(_nama_ayahMeta,
          nama_ayah.isAcceptableOrUnknown(data['nama_ayah']!, _nama_ayahMeta));
    } else if (isInserting) {
      context.missing(_nama_ayahMeta);
    }
    if (data.containsKey('nama_ibu')) {
      context.handle(_nama_ibuMeta,
          nama_ibu.isAcceptableOrUnknown(data['nama_ibu']!, _nama_ibuMeta));
    } else if (isInserting) {
      context.missing(_nama_ibuMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_anak};
  @override
  AnakData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnakData(
      id_anak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_anak'])!,
      nama_anak: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_anak'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      tgl_lahir: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}tgl_lahir'])!,
      nama_ayah: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_ayah'])!,
      nama_ibu: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_ibu'])!,
    );
  }

  @override
  $AnakTable createAlias(String alias) {
    return $AnakTable(attachedDatabase, alias);
  }
}

class AnakData extends DataClass implements Insertable<AnakData> {
  final int id_anak;
  final String nama_anak;
  final String gender;
  final DateTime tgl_lahir;
  final String nama_ayah;
  final String nama_ibu;
  const AnakData(
      {required this.id_anak,
      required this.nama_anak,
      required this.gender,
      required this.tgl_lahir,
      required this.nama_ayah,
      required this.nama_ibu});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_anak'] = Variable<int>(id_anak);
    map['nama_anak'] = Variable<String>(nama_anak);
    map['gender'] = Variable<String>(gender);
    map['tgl_lahir'] = Variable<DateTime>(tgl_lahir);
    map['nama_ayah'] = Variable<String>(nama_ayah);
    map['nama_ibu'] = Variable<String>(nama_ibu);
    return map;
  }

  AnakCompanion toCompanion(bool nullToAbsent) {
    return AnakCompanion(
      id_anak: Value(id_anak),
      nama_anak: Value(nama_anak),
      gender: Value(gender),
      tgl_lahir: Value(tgl_lahir),
      nama_ayah: Value(nama_ayah),
      nama_ibu: Value(nama_ibu),
    );
  }

  factory AnakData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnakData(
      id_anak: serializer.fromJson<int>(json['id_anak']),
      nama_anak: serializer.fromJson<String>(json['nama_anak']),
      gender: serializer.fromJson<String>(json['gender']),
      tgl_lahir: serializer.fromJson<DateTime>(json['tgl_lahir']),
      nama_ayah: serializer.fromJson<String>(json['nama_ayah']),
      nama_ibu: serializer.fromJson<String>(json['nama_ibu']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_anak': serializer.toJson<int>(id_anak),
      'nama_anak': serializer.toJson<String>(nama_anak),
      'gender': serializer.toJson<String>(gender),
      'tgl_lahir': serializer.toJson<DateTime>(tgl_lahir),
      'nama_ayah': serializer.toJson<String>(nama_ayah),
      'nama_ibu': serializer.toJson<String>(nama_ibu),
    };
  }

  AnakData copyWith(
          {int? id_anak,
          String? nama_anak,
          String? gender,
          DateTime? tgl_lahir,
          String? nama_ayah,
          String? nama_ibu}) =>
      AnakData(
        id_anak: id_anak ?? this.id_anak,
        nama_anak: nama_anak ?? this.nama_anak,
        gender: gender ?? this.gender,
        tgl_lahir: tgl_lahir ?? this.tgl_lahir,
        nama_ayah: nama_ayah ?? this.nama_ayah,
        nama_ibu: nama_ibu ?? this.nama_ibu,
      );
  @override
  String toString() {
    return (StringBuffer('AnakData(')
          ..write('id_anak: $id_anak, ')
          ..write('nama_anak: $nama_anak, ')
          ..write('gender: $gender, ')
          ..write('tgl_lahir: $tgl_lahir, ')
          ..write('nama_ayah: $nama_ayah, ')
          ..write('nama_ibu: $nama_ibu')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id_anak, nama_anak, gender, tgl_lahir, nama_ayah, nama_ibu);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnakData &&
          other.id_anak == this.id_anak &&
          other.nama_anak == this.nama_anak &&
          other.gender == this.gender &&
          other.tgl_lahir == this.tgl_lahir &&
          other.nama_ayah == this.nama_ayah &&
          other.nama_ibu == this.nama_ibu);
}

class AnakCompanion extends UpdateCompanion<AnakData> {
  final Value<int> id_anak;
  final Value<String> nama_anak;
  final Value<String> gender;
  final Value<DateTime> tgl_lahir;
  final Value<String> nama_ayah;
  final Value<String> nama_ibu;
  const AnakCompanion({
    this.id_anak = const Value.absent(),
    this.nama_anak = const Value.absent(),
    this.gender = const Value.absent(),
    this.tgl_lahir = const Value.absent(),
    this.nama_ayah = const Value.absent(),
    this.nama_ibu = const Value.absent(),
  });
  AnakCompanion.insert({
    this.id_anak = const Value.absent(),
    required String nama_anak,
    required String gender,
    required DateTime tgl_lahir,
    required String nama_ayah,
    required String nama_ibu,
  })  : nama_anak = Value(nama_anak),
        gender = Value(gender),
        tgl_lahir = Value(tgl_lahir),
        nama_ayah = Value(nama_ayah),
        nama_ibu = Value(nama_ibu);
  static Insertable<AnakData> custom({
    Expression<int>? id_anak,
    Expression<String>? nama_anak,
    Expression<String>? gender,
    Expression<DateTime>? tgl_lahir,
    Expression<String>? nama_ayah,
    Expression<String>? nama_ibu,
  }) {
    return RawValuesInsertable({
      if (id_anak != null) 'id_anak': id_anak,
      if (nama_anak != null) 'nama_anak': nama_anak,
      if (gender != null) 'gender': gender,
      if (tgl_lahir != null) 'tgl_lahir': tgl_lahir,
      if (nama_ayah != null) 'nama_ayah': nama_ayah,
      if (nama_ibu != null) 'nama_ibu': nama_ibu,
    });
  }

  AnakCompanion copyWith(
      {Value<int>? id_anak,
      Value<String>? nama_anak,
      Value<String>? gender,
      Value<DateTime>? tgl_lahir,
      Value<String>? nama_ayah,
      Value<String>? nama_ibu}) {
    return AnakCompanion(
      id_anak: id_anak ?? this.id_anak,
      nama_anak: nama_anak ?? this.nama_anak,
      gender: gender ?? this.gender,
      tgl_lahir: tgl_lahir ?? this.tgl_lahir,
      nama_ayah: nama_ayah ?? this.nama_ayah,
      nama_ibu: nama_ibu ?? this.nama_ibu,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_anak.present) {
      map['id_anak'] = Variable<int>(id_anak.value);
    }
    if (nama_anak.present) {
      map['nama_anak'] = Variable<String>(nama_anak.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (tgl_lahir.present) {
      map['tgl_lahir'] = Variable<DateTime>(tgl_lahir.value);
    }
    if (nama_ayah.present) {
      map['nama_ayah'] = Variable<String>(nama_ayah.value);
    }
    if (nama_ibu.present) {
      map['nama_ibu'] = Variable<String>(nama_ibu.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnakCompanion(')
          ..write('id_anak: $id_anak, ')
          ..write('nama_anak: $nama_anak, ')
          ..write('gender: $gender, ')
          ..write('tgl_lahir: $tgl_lahir, ')
          ..write('nama_ayah: $nama_ayah, ')
          ..write('nama_ibu: $nama_ibu')
          ..write(')'))
        .toString();
  }
}

class $PengukuranTable extends Pengukuran
    with TableInfo<$PengukuranTable, PengukuranData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PengukuranTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _id_pengukuranMeta =
      const VerificationMeta('id_pengukuran');
  @override
  late final GeneratedColumn<int> id_pengukuran = GeneratedColumn<int>(
      'id_pengukuran', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _id_anakMeta =
      const VerificationMeta('id_anak');
  @override
  late final GeneratedColumn<int> id_anak = GeneratedColumn<int>(
      'id_anak', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tgl_pengukuranMeta =
      const VerificationMeta('tgl_pengukuran');
  @override
  late final GeneratedColumn<DateTime> tgl_pengukuran =
      GeneratedColumn<DateTime>('tgl_pengukuran', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _edemaMeta = const VerificationMeta('edema');
  @override
  late final GeneratedColumn<String> edema = GeneratedColumn<String>(
      'edema', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _usiaMeta = const VerificationMeta('usia');
  @override
  late final GeneratedColumn<int> usia = GeneratedColumn<int>(
      'usia', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tbMeta = const VerificationMeta('tb');
  @override
  late final GeneratedColumn<double> tb = GeneratedColumn<double>(
      'tb', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bbMeta = const VerificationMeta('bb');
  @override
  late final GeneratedColumn<double> bb = GeneratedColumn<double>(
      'bb', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _imtuMeta = const VerificationMeta('imtu');
  @override
  late final GeneratedColumn<double> imtu = GeneratedColumn<double>(
      'imtu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tbbbMeta = const VerificationMeta('tbbb');
  @override
  late final GeneratedColumn<double> tbbb = GeneratedColumn<double>(
      'tbbb', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tbuMeta = const VerificationMeta('tbu');
  @override
  late final GeneratedColumn<double> tbu = GeneratedColumn<double>(
      'tbu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bbuMeta = const VerificationMeta('bbu');
  @override
  late final GeneratedColumn<double> bbu = GeneratedColumn<double>(
      'bbu', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id_pengukuran,
        id_anak,
        tgl_pengukuran,
        edema,
        usia,
        tb,
        bb,
        imtu,
        tbbb,
        tbu,
        bbu
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pengukuran';
  @override
  VerificationContext validateIntegrity(Insertable<PengukuranData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_pengukuran')) {
      context.handle(
          _id_pengukuranMeta,
          id_pengukuran.isAcceptableOrUnknown(
              data['id_pengukuran']!, _id_pengukuranMeta));
    }
    if (data.containsKey('id_anak')) {
      context.handle(_id_anakMeta,
          id_anak.isAcceptableOrUnknown(data['id_anak']!, _id_anakMeta));
    } else if (isInserting) {
      context.missing(_id_anakMeta);
    }
    if (data.containsKey('tgl_pengukuran')) {
      context.handle(
          _tgl_pengukuranMeta,
          tgl_pengukuran.isAcceptableOrUnknown(
              data['tgl_pengukuran']!, _tgl_pengukuranMeta));
    } else if (isInserting) {
      context.missing(_tgl_pengukuranMeta);
    }
    if (data.containsKey('edema')) {
      context.handle(
          _edemaMeta, edema.isAcceptableOrUnknown(data['edema']!, _edemaMeta));
    } else if (isInserting) {
      context.missing(_edemaMeta);
    }
    if (data.containsKey('usia')) {
      context.handle(
          _usiaMeta, usia.isAcceptableOrUnknown(data['usia']!, _usiaMeta));
    } else if (isInserting) {
      context.missing(_usiaMeta);
    }
    if (data.containsKey('tb')) {
      context.handle(_tbMeta, tb.isAcceptableOrUnknown(data['tb']!, _tbMeta));
    } else if (isInserting) {
      context.missing(_tbMeta);
    }
    if (data.containsKey('bb')) {
      context.handle(_bbMeta, bb.isAcceptableOrUnknown(data['bb']!, _bbMeta));
    } else if (isInserting) {
      context.missing(_bbMeta);
    }
    if (data.containsKey('imtu')) {
      context.handle(
          _imtuMeta, imtu.isAcceptableOrUnknown(data['imtu']!, _imtuMeta));
    }
    if (data.containsKey('tbbb')) {
      context.handle(
          _tbbbMeta, tbbb.isAcceptableOrUnknown(data['tbbb']!, _tbbbMeta));
    }
    if (data.containsKey('tbu')) {
      context.handle(
          _tbuMeta, tbu.isAcceptableOrUnknown(data['tbu']!, _tbuMeta));
    }
    if (data.containsKey('bbu')) {
      context.handle(
          _bbuMeta, bbu.isAcceptableOrUnknown(data['bbu']!, _bbuMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id_pengukuran};
  @override
  PengukuranData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PengukuranData(
      id_pengukuran: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_pengukuran'])!,
      id_anak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_anak'])!,
      tgl_pengukuran: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}tgl_pengukuran'])!,
      edema: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}edema'])!,
      usia: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usia'])!,
      tb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tb'])!,
      bb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bb'])!,
      imtu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}imtu']),
      tbbb: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tbbb']),
      tbu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tbu']),
      bbu: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bbu']),
    );
  }

  @override
  $PengukuranTable createAlias(String alias) {
    return $PengukuranTable(attachedDatabase, alias);
  }
}

class PengukuranData extends DataClass implements Insertable<PengukuranData> {
  final int id_pengukuran;
  final int id_anak;
  final DateTime tgl_pengukuran;
  final String edema;
  final int usia;
  final double tb;
  final double bb;
  final double? imtu;
  final double? tbbb;
  final double? tbu;
  final double? bbu;
  const PengukuranData(
      {required this.id_pengukuran,
      required this.id_anak,
      required this.tgl_pengukuran,
      required this.edema,
      required this.usia,
      required this.tb,
      required this.bb,
      this.imtu,
      this.tbbb,
      this.tbu,
      this.bbu});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_pengukuran'] = Variable<int>(id_pengukuran);
    map['id_anak'] = Variable<int>(id_anak);
    map['tgl_pengukuran'] = Variable<DateTime>(tgl_pengukuran);
    map['edema'] = Variable<String>(edema);
    map['usia'] = Variable<int>(usia);
    map['tb'] = Variable<double>(tb);
    map['bb'] = Variable<double>(bb);
    if (!nullToAbsent || imtu != null) {
      map['imtu'] = Variable<double>(imtu);
    }
    if (!nullToAbsent || tbbb != null) {
      map['tbbb'] = Variable<double>(tbbb);
    }
    if (!nullToAbsent || tbu != null) {
      map['tbu'] = Variable<double>(tbu);
    }
    if (!nullToAbsent || bbu != null) {
      map['bbu'] = Variable<double>(bbu);
    }
    return map;
  }

  PengukuranCompanion toCompanion(bool nullToAbsent) {
    return PengukuranCompanion(
      id_pengukuran: Value(id_pengukuran),
      id_anak: Value(id_anak),
      tgl_pengukuran: Value(tgl_pengukuran),
      edema: Value(edema),
      usia: Value(usia),
      tb: Value(tb),
      bb: Value(bb),
      imtu: imtu == null && nullToAbsent ? const Value.absent() : Value(imtu),
      tbbb: tbbb == null && nullToAbsent ? const Value.absent() : Value(tbbb),
      tbu: tbu == null && nullToAbsent ? const Value.absent() : Value(tbu),
      bbu: bbu == null && nullToAbsent ? const Value.absent() : Value(bbu),
    );
  }

  factory PengukuranData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PengukuranData(
      id_pengukuran: serializer.fromJson<int>(json['id_pengukuran']),
      id_anak: serializer.fromJson<int>(json['id_anak']),
      tgl_pengukuran: serializer.fromJson<DateTime>(json['tgl_pengukuran']),
      edema: serializer.fromJson<String>(json['edema']),
      usia: serializer.fromJson<int>(json['usia']),
      tb: serializer.fromJson<double>(json['tb']),
      bb: serializer.fromJson<double>(json['bb']),
      imtu: serializer.fromJson<double?>(json['imtu']),
      tbbb: serializer.fromJson<double?>(json['tbbb']),
      tbu: serializer.fromJson<double?>(json['tbu']),
      bbu: serializer.fromJson<double?>(json['bbu']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id_pengukuran': serializer.toJson<int>(id_pengukuran),
      'id_anak': serializer.toJson<int>(id_anak),
      'tgl_pengukuran': serializer.toJson<DateTime>(tgl_pengukuran),
      'edema': serializer.toJson<String>(edema),
      'usia': serializer.toJson<int>(usia),
      'tb': serializer.toJson<double>(tb),
      'bb': serializer.toJson<double>(bb),
      'imtu': serializer.toJson<double?>(imtu),
      'tbbb': serializer.toJson<double?>(tbbb),
      'tbu': serializer.toJson<double?>(tbu),
      'bbu': serializer.toJson<double?>(bbu),
    };
  }

  PengukuranData copyWith(
          {int? id_pengukuran,
          int? id_anak,
          DateTime? tgl_pengukuran,
          String? edema,
          int? usia,
          double? tb,
          double? bb,
          Value<double?> imtu = const Value.absent(),
          Value<double?> tbbb = const Value.absent(),
          Value<double?> tbu = const Value.absent(),
          Value<double?> bbu = const Value.absent()}) =>
      PengukuranData(
        id_pengukuran: id_pengukuran ?? this.id_pengukuran,
        id_anak: id_anak ?? this.id_anak,
        tgl_pengukuran: tgl_pengukuran ?? this.tgl_pengukuran,
        edema: edema ?? this.edema,
        usia: usia ?? this.usia,
        tb: tb ?? this.tb,
        bb: bb ?? this.bb,
        imtu: imtu.present ? imtu.value : this.imtu,
        tbbb: tbbb.present ? tbbb.value : this.tbbb,
        tbu: tbu.present ? tbu.value : this.tbu,
        bbu: bbu.present ? bbu.value : this.bbu,
      );
  @override
  String toString() {
    return (StringBuffer('PengukuranData(')
          ..write('id_pengukuran: $id_pengukuran, ')
          ..write('id_anak: $id_anak, ')
          ..write('tgl_pengukuran: $tgl_pengukuran, ')
          ..write('edema: $edema, ')
          ..write('usia: $usia, ')
          ..write('tb: $tb, ')
          ..write('bb: $bb, ')
          ..write('imtu: $imtu, ')
          ..write('tbbb: $tbbb, ')
          ..write('tbu: $tbu, ')
          ..write('bbu: $bbu')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id_pengukuran, id_anak, tgl_pengukuran, edema,
      usia, tb, bb, imtu, tbbb, tbu, bbu);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PengukuranData &&
          other.id_pengukuran == this.id_pengukuran &&
          other.id_anak == this.id_anak &&
          other.tgl_pengukuran == this.tgl_pengukuran &&
          other.edema == this.edema &&
          other.usia == this.usia &&
          other.tb == this.tb &&
          other.bb == this.bb &&
          other.imtu == this.imtu &&
          other.tbbb == this.tbbb &&
          other.tbu == this.tbu &&
          other.bbu == this.bbu);
}

class PengukuranCompanion extends UpdateCompanion<PengukuranData> {
  final Value<int> id_pengukuran;
  final Value<int> id_anak;
  final Value<DateTime> tgl_pengukuran;
  final Value<String> edema;
  final Value<int> usia;
  final Value<double> tb;
  final Value<double> bb;
  final Value<double?> imtu;
  final Value<double?> tbbb;
  final Value<double?> tbu;
  final Value<double?> bbu;
  const PengukuranCompanion({
    this.id_pengukuran = const Value.absent(),
    this.id_anak = const Value.absent(),
    this.tgl_pengukuran = const Value.absent(),
    this.edema = const Value.absent(),
    this.usia = const Value.absent(),
    this.tb = const Value.absent(),
    this.bb = const Value.absent(),
    this.imtu = const Value.absent(),
    this.tbbb = const Value.absent(),
    this.tbu = const Value.absent(),
    this.bbu = const Value.absent(),
  });
  PengukuranCompanion.insert({
    this.id_pengukuran = const Value.absent(),
    required int id_anak,
    required DateTime tgl_pengukuran,
    required String edema,
    required int usia,
    required double tb,
    required double bb,
    this.imtu = const Value.absent(),
    this.tbbb = const Value.absent(),
    this.tbu = const Value.absent(),
    this.bbu = const Value.absent(),
  })  : id_anak = Value(id_anak),
        tgl_pengukuran = Value(tgl_pengukuran),
        edema = Value(edema),
        usia = Value(usia),
        tb = Value(tb),
        bb = Value(bb);
  static Insertable<PengukuranData> custom({
    Expression<int>? id_pengukuran,
    Expression<int>? id_anak,
    Expression<DateTime>? tgl_pengukuran,
    Expression<String>? edema,
    Expression<int>? usia,
    Expression<double>? tb,
    Expression<double>? bb,
    Expression<double>? imtu,
    Expression<double>? tbbb,
    Expression<double>? tbu,
    Expression<double>? bbu,
  }) {
    return RawValuesInsertable({
      if (id_pengukuran != null) 'id_pengukuran': id_pengukuran,
      if (id_anak != null) 'id_anak': id_anak,
      if (tgl_pengukuran != null) 'tgl_pengukuran': tgl_pengukuran,
      if (edema != null) 'edema': edema,
      if (usia != null) 'usia': usia,
      if (tb != null) 'tb': tb,
      if (bb != null) 'bb': bb,
      if (imtu != null) 'imtu': imtu,
      if (tbbb != null) 'tbbb': tbbb,
      if (tbu != null) 'tbu': tbu,
      if (bbu != null) 'bbu': bbu,
    });
  }

  PengukuranCompanion copyWith(
      {Value<int>? id_pengukuran,
      Value<int>? id_anak,
      Value<DateTime>? tgl_pengukuran,
      Value<String>? edema,
      Value<int>? usia,
      Value<double>? tb,
      Value<double>? bb,
      Value<double?>? imtu,
      Value<double?>? tbbb,
      Value<double?>? tbu,
      Value<double?>? bbu}) {
    return PengukuranCompanion(
      id_pengukuran: id_pengukuran ?? this.id_pengukuran,
      id_anak: id_anak ?? this.id_anak,
      tgl_pengukuran: tgl_pengukuran ?? this.tgl_pengukuran,
      edema: edema ?? this.edema,
      usia: usia ?? this.usia,
      tb: tb ?? this.tb,
      bb: bb ?? this.bb,
      imtu: imtu ?? this.imtu,
      tbbb: tbbb ?? this.tbbb,
      tbu: tbu ?? this.tbu,
      bbu: bbu ?? this.bbu,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id_pengukuran.present) {
      map['id_pengukuran'] = Variable<int>(id_pengukuran.value);
    }
    if (id_anak.present) {
      map['id_anak'] = Variable<int>(id_anak.value);
    }
    if (tgl_pengukuran.present) {
      map['tgl_pengukuran'] = Variable<DateTime>(tgl_pengukuran.value);
    }
    if (edema.present) {
      map['edema'] = Variable<String>(edema.value);
    }
    if (usia.present) {
      map['usia'] = Variable<int>(usia.value);
    }
    if (tb.present) {
      map['tb'] = Variable<double>(tb.value);
    }
    if (bb.present) {
      map['bb'] = Variable<double>(bb.value);
    }
    if (imtu.present) {
      map['imtu'] = Variable<double>(imtu.value);
    }
    if (tbbb.present) {
      map['tbbb'] = Variable<double>(tbbb.value);
    }
    if (tbu.present) {
      map['tbu'] = Variable<double>(tbu.value);
    }
    if (bbu.present) {
      map['bbu'] = Variable<double>(bbu.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PengukuranCompanion(')
          ..write('id_pengukuran: $id_pengukuran, ')
          ..write('id_anak: $id_anak, ')
          ..write('tgl_pengukuran: $tgl_pengukuran, ')
          ..write('edema: $edema, ')
          ..write('usia: $usia, ')
          ..write('tb: $tb, ')
          ..write('bb: $bb, ')
          ..write('imtu: $imtu, ')
          ..write('tbbb: $tbbb, ')
          ..write('tbu: $tbu, ')
          ..write('bbu: $bbu')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $AnakTable anak = $AnakTable(this);
  late final $PengukuranTable pengukuran = $PengukuranTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [anak, pengukuran];
}
