import 'package:flutter_test/flutter_test.dart';
import 'package:studymate_ai_app/app/features/library/parser.dart';

void main() {
  test('extract key phrases returns frequent tokens', () {
    final text = 'apple banana apple orange banana apple';
    final phrases = extractKeyPhrases(text);
    expect(phrases.first, 'apple');
    expect(phrases.contains('banana'), isTrue);
  });
}

