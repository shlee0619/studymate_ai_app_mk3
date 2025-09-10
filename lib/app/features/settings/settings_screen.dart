import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final ctrl = TextEditingController(text: s.apiBaseUrl);
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        TextField(
          controller: ctrl,
          decoration: const InputDecoration(labelText: 'API Base URL', border: OutlineInputBorder()),
          onSubmitted: (v) => ref.read(settingsProvider.notifier).state = s.copyWith(apiBaseUrl: v),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => ref.read(settingsProvider.notifier).state = s.copyWith(apiBaseUrl: ctrl.text),
              icon: const Icon(Icons.save),
              label: const Text('Save URL'),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () async {
                final dio = ref.read(apiClientProvider).dio;
                try {
                  var resp = await dio.get('/health');
                  if (resp.statusCode == null || resp.statusCode! >= 400) {
                    // try root fallback
                    resp = await dio.get('/');
                  }
                  final ok = (resp.statusCode ?? 0) < 400;
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(ok ? 'API OK (${resp.statusCode})' : 'API responded with ${resp.statusCode}')),
                    );
                  }
                } on DioException catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('API error: ${e.message}')),
                    );
                  }
                }
              },
              icon: const Icon(Icons.wifi_tethering),
              label: const Text('Test API'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          value: s.useFirebase,
          onChanged: (v) => ref.read(settingsProvider.notifier).state = s.copyWith(useFirebase: v),
          title: const Text('Use Firebase (fallback to local if disabled)'),
        ),
        const Divider(),
        ElevatedButton.icon(
          onPressed: () async {
            final db = ref.read(localDbProvider);
            await db.delete(db.items).go();
            await db.delete(db.attempts).go();
            await db.delete(db.errorTags).go();
            await db.delete(db.evidences).go();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Local data cleared')));
            }
          },
          icon: const Icon(Icons.delete_forever),
          label: const Text('Clear Local Data'),
        ),
      ],
    );
  }
}
