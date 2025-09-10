import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/providers.dart';

class ErrorProfileScreen extends ConsumerWidget {
  const ErrorProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repos = ref.watch(repositoriesProvider);
    return FutureBuilder(
      future: Future.wait([
        repos.attempts.errorTagHistogram(),
        repos.errorTags.all(),
      ]),
      builder: (context, snap) {
        if (!snap.hasData) return const Center(child: CircularProgressIndicator());
        final list = snap.data as List<Object?>;
        final hist = list[0] as Map<String, int>;
        final tags = list[1] as List;
        if (hist.isEmpty) return const Center(child: Text('No error tags yet'));
        final nameById = {
          for (final t in tags.cast<dynamic>())
            (t as dynamic).id as String: (t as dynamic).name as String
        };
        final total = hist.values.fold<int>(0, (a, b) => a + b);
        final entries = hist.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            for (final e in entries)
              ListTile(
                title: Text(nameById[e.key] ?? e.key),
                trailing: Text('${e.value}'),
                subtitle: LinearProgressIndicator(value: total == 0 ? 0 : e.value / total),
              ),
          ],
        );
      },
    );
  }
}
