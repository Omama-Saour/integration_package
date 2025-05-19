import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_package/global/consts.dart';
import 'package:integration_package/steps/stepper_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Package Integrator',
      theme: ThemeData(
        colorSchemeSeed: primary1,
      ),
      debugShowCheckedModeBanner: false,
      home: const StepperScreen(),
    );
  }
}
