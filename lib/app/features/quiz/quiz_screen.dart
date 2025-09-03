import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/providers.dart';
import '../../domain/models.dart';
import '../quiz/session_controller.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int? selected;
  double confidence = 0.5;
  String feedback = '';
  String evidence = '';

  Future<void> _submit(Item item) async {
    if (selected == null) return;
    final res = await ref.read(sessionControllerProvider.notifier).submit(selected!, confidence);
    res.when(
      ok: (_) async {
        final api = ref.read(apiClientProvider).dio;
        try {
          final s = await api.post('/search', data: {"query": item.stem, "topK": 2});
          final hit = s.data['hits'] is List && (s.data['hits'] as List).isNotEmpty ? s.data['hits'][0] : null;
          setState(() {
            feedback = selected == item.answerIndex ? 'Correct' : 'Incorrect';
            evidence = hit != null ? hit['snippet'] as String : '';
            selected = null;
          });
        } on DioException {
          setState(() {
            feedback = selected == item.answerIndex ? 'Correct' : 'Incorrect';
            evidence = '';
            selected = null;
          });
        }
      },
      err: (e) => setState(() => feedback = e.message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sessionControllerProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
      data: (item) {
        if (item == null) return const Center(child: Text('No items. Go to Library.'));
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.stem, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              ...List.generate(item.options.length, (i) => RadioListTile<int>(
                    title: Text(item.options[i]),
                    value: i,
                    groupValue: selected,
                    onChanged: (v) => setState(() => selected = v),
                  )),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Confidence'),
                  Expanded(
                    child: Slider(
                      value: confidence,
                      onChanged: (v) => setState(() => confidence = double.parse(v.toStringAsFixed(1))),
                      min: 0.0,
                      max: 1.0,
                      divisions: 10,
                    ),
                  ),
                  Text(confidence.toStringAsFixed(1)),
                ],
              ),
              FilledButton.icon(
                onPressed: selected == null ? null : () => _submit(item),
                icon: const Icon(Icons.check),
                label: const Text('Submit'),
              ),
              const SizedBox(height: 8),
              if (feedback.isNotEmpty) Text(feedback, style: const TextStyle(fontWeight: FontWeight.bold)),
              if (evidence.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                  child: Text('Evidence:\n$evidence'),
                ),
            ],
          ),
        );
      },
    );
  }
}
