import 'dart:io';

Future<String> installGoogleMapsPackage(String projectPath) async {
  final pubspecFile = File('$projectPath/pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    return 'pubspec.yaml not found at $projectPath';
  }

  final content = pubspecFile.readAsStringSync();

  if (content.contains('google_maps_flutter')) {
    return 'Package already exists in pubspec.yaml';
  }

  final lines = content.split('\n');
  final buffer = StringBuffer();

  bool inserted = false;

  for (final line in lines) {
    buffer.writeln(line);
    if (!inserted && line.trim() == 'dependencies:') {
      buffer.writeln('  google_maps_flutter: ^2.12.1');
      inserted = true;
    }
  }

  try {
    pubspecFile.writeAsStringSync(buffer.toString());

    print('google_maps_flutter added to pubspec.yaml');
  } on Exception catch (e) {
    return 'Error writing to pubspec.yaml: $e';
  }
  try {
    // Running flutter pub get on project
    final result = await Process.run(
        'C:\\fluttersdk\\flutter\\bin\\flutter.bat', ['pub', 'get'],
        workingDirectory: projectPath);

    if (result.exitCode == 0) {
      print(result.stdout);
      return 'pub get completed successfully';
    } else {
      // If there some another error in the yaml file
      return 'Error running flutter pub get: ${result.stderr}';
    }
  } catch (error) {
    return 'Error running flutter pub get: $error';
  }
}
