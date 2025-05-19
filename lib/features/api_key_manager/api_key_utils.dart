import 'dart:io';
import '../../global/consts.dart';

Future<String> saveApiKeyToAndroid(String apiKey) async {
  final androidManifestFile =
      File('$projectPathGlobal/android/app/src/main/AndroidManifest.xml');

  if (!androidManifestFile.existsSync()) {
    return "AndroidManifest.xml not found.";
  }

  String content = await androidManifestFile.readAsString();
  if (content.contains('com.google.android.geo.API_KEY')) {
    return 'The API key already exists in Android';
  }
  if (content.contains('</application>')) {
    content = content.replaceFirst(
      '</application>',
      '\n        <meta-data android:name="com.google.android.geo.API_KEY"\n                   android:value="$apiKey"/>\n    </application>',
    );
  }

  await androidManifestFile.writeAsString(content);
  return "AndroidManifest.xml updated successfully.";
}

Future<String> saveApiKeyToIOS(String apiKey) async {
  final infoPlistFile = File('$projectPathGlobal/ios/Runner/AppDelegate.swift');
  if (!infoPlistFile.existsSync()) {
    return "AppDelegate.swift not found!";
  }

  String content = await infoPlistFile.readAsString();
  if (content.contains('GMSServices.provideAPIKey')) {
    return 'The API key already exists in IOS';
  }
  final metaDataEntry = '''
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("$apiKey")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
''';
  if (content.contains('import UIKit')) {
    content =
        content.replaceFirst('import UIKit', 'import UIKit\n$metaDataEntry');
  }

  await infoPlistFile.writeAsString(content);
  return "AppDelegate.swift updated successfully.";
}

Future<String> saveApiKey(String apiKey) async {
  try {
    final androidResult = await saveApiKeyToAndroid(apiKey);
    final iosResult = await saveApiKeyToIOS(apiKey);
    return "$androidResult && $iosResult";
  } catch (e) {
    return 'An error happen: $e';
  }
}
