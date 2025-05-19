import 'package:flutter_riverpod/flutter_riverpod.dart';

final resultMessageProvider = StateProvider<String>((ref) {
  return "Just click 'Next' if you want to skip this step.";
});

final apiKeyProvider = StateNotifierProvider<ApiKeyNotifier, String?>(
  (ref) => ApiKeyNotifier(),
);

class ApiKeyNotifier extends StateNotifier<String?> {
  ApiKeyNotifier() : super(null);

  void setApiKey(String key) {
    state = key;
  }

  void clearApiKey() {
    state = null;
  }
}
