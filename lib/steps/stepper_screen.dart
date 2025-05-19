import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_package/global/consts.dart';
import 'package:integration_package/steps/dialog_util.dart';
import 'package:integration_package/steps/step_provider.dart';
import 'package:integration_package/steps/stepper_button_util.dart';
import 'package:integration_package/steps/steps_data.dart';

class StepperScreen extends ConsumerWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(stepProvider);
    final stepController = ref.read(stepProvider.notifier);
    const int maxSteps = 4;

    return MaterialApp(
      title: 'Flutter Package Integrator',
      theme: ThemeData(
        colorSchemeSeed: primary1,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Automated Package Integration in a Flutter Project",
            style: TextStyle(color: primary2, fontSize: 20),
          ),
          backgroundColor: primary1,
        ),
        body: SingleChildScrollView(
          child: Stepper(
            currentStep: currentStep,
            onStepContinue: () => _handleStepContinue(context, ref, currentStep, maxSteps),
            onStepCancel: () {
              if (currentStep > 0) {
                stepController.previousStep();
              }
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final isLastStep = currentStep == maxSteps - 1;
              return Row(
                children: <Widget>[
                  StepperButton(
                    onPressed: details.onStepContinue!,
                    label: isLastStep ? 'Finish' : 'Next',
                    isPrimary: true,
                  ),
                  const SizedBox(width: 8),
                  if (currentStep > 0)
                    StepperButton(
                      onPressed: details.onStepCancel!,
                      label: 'Previous',
                      isPrimary: false,
                    ),
                ],
              );
            },
            steps: getStepperSteps(context, currentStep),
          ),
        ),
      ),
    );
  }
}

void _handleStepContinue(BuildContext context, WidgetRef ref, int currentStep, int maxSteps) {
  final stepController = ref.read(stepProvider.notifier);

  // Block progression if projectPathGlobal is not set
  if (currentStep == 0 && (projectPathGlobal == null || projectPathGlobal!.isEmpty)) {
    DialogUtil.showStatusDialog(context, "Error", "Please select a valid Flutter project directory first.");
    return;
  }

  if (currentStep < maxSteps - 1) {
    stepController.nextStep();
  } else {
    DialogUtil.showStatusDialog(context, "Success", "All steps completed successfully.");
  }
}
