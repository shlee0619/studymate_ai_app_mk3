abstract class OcrService {
  Future<String> extractTextFromImage(List<int> bytes);
}

class DummyOcrService implements OcrService {
  @override
  Future<String> extractTextFromImage(List<int> bytes) async {
    return 'OCR not enabled. Please paste text manually.';
  }
}

