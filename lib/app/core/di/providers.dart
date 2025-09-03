import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/drift/local_db.dart';
import '../../domain/repositories.dart';
import '../net/dio_client.dart';

final uuidProvider = Provider<Uuid>((ref) => const Uuid());

final settingsProvider = StateProvider<SettingsState>((ref) =>
    const SettingsState(apiBaseUrl: 'http://127.0.0.1:8000', useFirebase: false));

class SettingsState {
  final String apiBaseUrl;
  final bool useFirebase;
  const SettingsState({required this.apiBaseUrl, required this.useFirebase});

  SettingsState copyWith({String? apiBaseUrl, bool? useFirebase}) =>
      SettingsState(
          apiBaseUrl: apiBaseUrl ?? this.apiBaseUrl,
          useFirebase: useFirebase ?? this.useFirebase);
}

final apiClientProvider = Provider<ApiClient>((ref) {
  final base = ref.watch(settingsProvider).apiBaseUrl;
  return ApiClient(base);
});

final localDbProvider = Provider<LocalDb>((ref) => LocalDb());

final repositoriesProvider = Provider<Repositories>((ref) {
  // Firebase disabled by default; DI fallback to LocalDb repositories
  final db = ref.watch(localDbProvider);
  return Repositories.local(db);
});

