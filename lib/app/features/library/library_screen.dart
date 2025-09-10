
import 'package:dio/dio.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/providers.dart';
import '../../domain/models.dart';
import 'parser.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  final _controller = TextEditingController();
  bool _busy = false;
  String _status = '';

  Future<void> _loadSample() async {
    final txt = await rootBundle.loadString('assets/sample_notes/sample1.txt');
    _controller.text = txt;
  }

  Future<void> _generate() async {
    setState(() => _busy = true);
    final api = ref.read(apiClientProvider).dio;
    final repos = ref.read(repositoriesProvider);
    try {
      final resp = await api.post('/generate/items', data: {"rawText": _controller.text, "k": 10});
      final items = (resp.data['items'] as List)
          .map((e) => Item.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      await repos.items.upsertAll(items);
      setState(() => _status = 'Generated ${items.length} items');
    } on DioException catch (e) {
      // Network/CORS issue: fall back to local generation
      final local = _generateLocalItems(_controller.text, 10);
      if (local.isNotEmpty) {
        await repos.items.upsertAll(local);
        setState(() => _status = 'API failed (${e.message}). Locally generated ${local.length} items.');
      } else {
        setState(() => _status = 'API failed (${e.message}). No local items generated.');
      }
    } finally {
      setState(() => _busy = false);
    }
  }

  Future<void> _ingest() async {
    setState(() => _busy = true);
    final api = ref.read(apiClientProvider).dio;
    try {
      final text = _controller.text;
      final chunks = [for (var i = 0; i < text.length; i += 500) text.substring(i, (i + 500).clamp(0, text.length))];
      final docId = DateTime.now().millisecondsSinceEpoch.toString();
      final resp = await api.post('/ingest', data: {"docId": docId, "chunks": chunks});
      setState(() => _status = 'Ingested ${resp.data['count']} chunks');
    } on DioException catch (e) {
      setState(() => _status = 'Error: ${e.message}');
    } finally {
      setState(() => _busy = false);
    }
  }

  List<Item> _generateLocalItems(String text, int k) {
    final phrases = extractKeyPhrases(text);
    if (phrases.isEmpty) return [];
    final rand = DateTime.now().millisecondsSinceEpoch;
    final rng = Random(rand);
    final items = <Item>[];
    final pool = phrases.toList();
    for (final target in pool.take(k)) {
      final distractors = pool.where((p) => p != target).toList()..shuffle(rng);
      final opts = <String>{target}..addAll(distractors.take(3));
      while (opts.length < 4) {
        opts.add('Option ${opts.length + 1}');
      }
      final options = opts.toList()..shuffle(rng);
      final answerIndex = options.indexOf(target);
      items.add(Item(
        id: ref.read(uuidProvider).v4(),
        stem: 'Which term best matches your notes?',
        options: options,
        answerIndex: answerIndex < 0 ? 0 : answerIndex,
        difficulty: 0.5,
      ));
    }
    return items;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: _busy ? null : _loadSample,
                icon: const Icon(Icons.insert_drive_file),
                label: _busy
                    ? const _BtnLabelBusy(text: 'Load Sample')
                    : const Text('Load Sample'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: _busy ? null : _generate,
                icon: const Icon(Icons.auto_fix_high),
                label: _busy
                    ? const _BtnLabelBusy(text: 'Autocard')
                    : const Text('Autocard'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: _busy ? null : _ingest,
                icon: const Icon(Icons.upload),
                label: _busy
                    ? const _BtnLabelBusy(text: 'Ingest to RAG')
                    : const Text('Ingest to RAG'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Paste or type study notes here'),
            ),
          ),
          const SizedBox(height: 8),
          Text(_status, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _BtnLabelBusy extends StatelessWidget {
  final String text;
  const _BtnLabelBusy({required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 14,
          width: 14,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
