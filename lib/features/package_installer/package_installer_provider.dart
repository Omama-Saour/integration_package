import 'package:flutter_riverpod/flutter_riverpod.dart';

final resultMessageProvider = StateProvider<String>((ref) {
  return "Just click 'Next' if you want to skip this step.";
});

final packageInstallerProvider =
    StateNotifierProvider<PackageInstallerNotifier, bool>(
  (ref) => PackageInstallerNotifier(),
);

class PackageInstallerNotifier extends StateNotifier<bool> {
  PackageInstallerNotifier() : super(false);

  void startInstallation() {
    state = true;
  }

  void completeInstallation() {
    state = false;
  }
}
