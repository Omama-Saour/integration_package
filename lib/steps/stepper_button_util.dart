import 'package:flutter/material.dart';
import 'package:integration_package/global/consts.dart';

class StepperButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isPrimary;

  const StepperButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? primary1 : primary2,
          foregroundColor: isPrimary ? primary2 : primary1,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
