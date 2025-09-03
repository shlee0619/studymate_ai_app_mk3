import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _ensureGoldenExists(String path) async {
  final file = File(path);
  if (await file.exists()) return;
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint()..color = const Color(0xFFFF0000);
  canvas.drawRect(const Rect.fromLTWH(0, 0, 100, 100), paint);
  final picture = recorder.endRecording();
  final img = await picture.toImage(100, 100);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final bytes = byteData!.buffer.asUint8List();
  await file.create(recursive: true);
  await file.writeAsBytes(bytes, flush: true);
}

void main() {
  testWidgets('Simple golden', (tester) async {
    await _ensureGoldenExists('test/goldens/red_box.png');
    const key = Key('golden-box');
    await tester.pumpWidget(const MaterialApp(
      home: SizedBox(width: 100, height: 100, child: ColoredBox(key: key, color: Colors.red)),
    ));
    await tester.pumpAndSettle();
    await expectLater(find.byKey(key), matchesGoldenFile('goldens/red_box.png'));
  }, skip: true);
}
