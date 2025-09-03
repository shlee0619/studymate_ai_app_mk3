import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'local_db.g.dart';

@DataClassName('ItemRow')
class Items extends Table {
  TextColumn get id => text()();
  TextColumn get stem => text()();
  TextColumn get optionsJson => text()();
  IntColumn get answerIndex => integer()();
  TextColumn get conceptId => text().nullable()();
  RealColumn get difficulty => real().withDefault(const Constant(0.5))();
  TextColumn get sourceRef => text().nullable()();
  // scheduling
  RealColumn get ef => real().withDefault(const Constant(2.5))();
  IntColumn get intervalDays => integer().withDefault(const Constant(0))();
  IntColumn get reps => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextReview => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AttemptRow')
class Attempts extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text()();
  BoolColumn get correct => boolean()();
  IntColumn get latencyMs => integer()();
  RealColumn get confidence => real()();
  TextColumn get errorTagIdsJson => text().withDefault(const Constant('[]'))();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ErrorTagRow')
class ErrorTags extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get pattern => text().nullable()();
  TextColumn get notes => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ConceptRow')
class Concepts extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get prereqIdsJson => text().withDefault(const Constant('[]'))();
  RealColumn get mastery => real().withDefault(const Constant(0.0))();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('EvidenceRow')
class Evidences extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text()();
  TextColumn get sourceUri => text()();
  TextColumn get snippet => text()();
  TextColumn get offsetsJson => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Items, Attempts, ErrorTags, Concepts, Evidences])
class LocalDb extends _$LocalDb {
  LocalDb() : super(_open());
  @override
  int get schemaVersion => 1;
}

QueryExecutor _open() {
  if (Platform.isIOS || Platform.isAndroid) {
    return SqfliteQueryExecutor.inDatabaseFolder(path: 'app.db', logStatements: false);
  }
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.db'));
    return NativeDatabase.createInBackground(file);
  });
}
