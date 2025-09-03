import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/providers.dart';

class ErrorProfileScreen extends ConsumerWidget {
  const ErrorProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repos = ref.watch(repositoriesProvider);
    return FutureBuilder(
      future: repos.attempts.errorTagHistogram(),
      builder: (context, snap) {
        final data = snap.data ?? {};
        if (data.isEmpty) return const Center(child: Text('No error tags yet'));
        final total = data.values.fold<int>(0, (a, b) => a + b);
        return ListView(
          padding: const EdgeInsets.all(12),
          children: data.entries
              .map((e) => ListTile(
                    title: Text(e.key),
                    trailing: Text('${e.value}'),
                    subtitle: LinearProgressIndicator(value: total == 0 ? 0 : e.value / total),
                  ))
              .toList(),
        );
      },
    );
  }
}

