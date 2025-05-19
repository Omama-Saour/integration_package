import 'dart:io';
import 'package:filepicker_windows/filepicker_windows.dart';
import '../../global/consts.dart';

Future<String?> pickDirectory() async {
  final folderPicker = DirectoryPicker();
  final selectedDir = folderPicker.getDirectory();

  if (selectedDir != null) {
    final flutterProject = File('${selectedDir.path}/pubspec.yaml');
    if (flutterProject.existsSync()) {
      projectPathGlobal = selectedDir.path;
      return selectedDir.path;
    } else {
      return null; // Not a valid Flutter project
    }
  }
  return null; // Nothing selected
}
