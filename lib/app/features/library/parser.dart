List<String> extractKeyPhrases(String text) {
  final words = text
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9\s]'), ' ')
      .split(RegExp(r'\s+'))
      .where((w) => w.length > 3)
      .toList();
  final counts = <String, int>{};
  for (final w in words) {
    counts[w] = (counts[w] ?? 0) + 1;
  }
  final sorted = counts.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));
  return sorted.take(10).map((e) => e.key).toList();
}

