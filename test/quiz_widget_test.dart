import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studymate_ai_app/app/features/quiz/quiz_screen.dart';

void main() {
  testWidgets('Quiz screen renders basic UI', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: QuizScreen())));
    expect(find.textContaining('No items'), findsOneWidget);
  });
}

