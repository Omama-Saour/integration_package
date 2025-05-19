import 'package:flutter/material.dart';
import 'package:integration_package/steps/stepper_button_util.dart';

class DialogUtil {
  static void showStatusDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            StepperButton(
              onPressed: () => Navigator.of(context).pop(),
              label: "OK",
              isPrimary: true,
            ),
          ],
        ),
      ),
    );
  }
}
