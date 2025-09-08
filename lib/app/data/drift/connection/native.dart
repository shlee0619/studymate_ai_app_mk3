import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

// Mobile/Desktop (non-web) connection using sqflite
QueryExecutor openConnection() {
  // Stores the database in the default database folder for the platform.
  // The file name can be adjusted as needed.
  return SqfliteQueryExecutor.inDatabaseFolder(
    path: 'app.db',
    logStatements: false,
  );
}

