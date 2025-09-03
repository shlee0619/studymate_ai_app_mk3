import 'package:flutter/material.dart';
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
