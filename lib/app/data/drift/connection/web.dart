import 'package:drift/drift.dart';
import 'package:drift/web.dart';

// Web connection using IndexedDB via drift/web
QueryExecutor openConnection() {
  // Database name can be adjusted as needed.
  return WebDatabase('app');
}

