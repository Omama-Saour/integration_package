import 'package:flutter_riverpod/flutter_riverpod.dart';

final projectPathProvider = StateNotifierProvider<ProjectPathNotifier, String?>(
  (ref) => ProjectPathNotifier(),
);

class ProjectPathNotifier extends StateNotifier<String?> {
  ProjectPathNotifier() : super(null);

  void setPath(String path) {
    state = path;
  }

  void clearPath() {
    state = null;
  }
}
