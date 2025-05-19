import 'package:flutter/material.dart';
import '../features/api_key_manager/api_key_screen.dart';
import '../features/google_maps_demo/google_maps_demo_screen.dart';
import '../features/package_installer/package_installer_screen.dart';
import '../features/project_selector/project_selector_screen.dart';

List<Step> getStepperSteps(BuildContext context, int currentStep) {
  return [
    Step(
        isActive: currentStep == 0,
        title: const Text("Step One: Project Selection"),
        subtitle: const Text(
            "Pick a Flutter project directory. Make sure it is validate (check for pubspec.yaml) or you can`t continue."),
        content: SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: const ProjectSelectorScreen())),
    Step(
        isActive: currentStep == 1,
        title: const Text("Step Tow: Automate Package Integration"),
        subtitle: const Text(
            "This step will add google_maps_flutter to pubspec.yaml and run flutter pub get automatically."),
        content: SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: const PackageInstallerScreen())),
    Step(
        isActive: currentStep == 2,
        title:
            const Text("Step three: Adding API Key && Platform Configuration"),
        subtitle: const Text(
            "Enter a Google Maps API key. Or skip this step if the key is already configured (Android && iOS)"),
        content: SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: const ApiKeyManagerScreen())),
    Step(
        isActive: currentStep == 3,
        title: const Text("Step Four: Demo Integration"),
        subtitle: const Text(
            "This step will add a simple Google Map widget to the main screen. It should run without errors."),
        content: SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: const GoogleMapsDemoScreen())),
  ];
}
