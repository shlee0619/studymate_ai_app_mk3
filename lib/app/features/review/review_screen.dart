import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/providers.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repos = ref.watch(repositoriesProvider);
    return FutureBuilder(
      future: repos.items.dueToday(DateTime.now()),
      builder: (context, snap) {
        final items = snap.data ?? [];
        if (items.isEmpty) return const Center(child: Text('No items due today'));
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) => ListTile(
            title: Text(items[i].stem),
            subtitle: Text('Difficulty ${(items[i].difficulty * 100).round()}%'),
          ),
        );
      },
    );
  }
}
