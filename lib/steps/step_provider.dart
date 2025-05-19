import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepController extends StateNotifier<int> {
  StepController() : super(0);

  void nextStep() {

    if (state < 3) {
      state++;
    }
  }

  void previousStep() {
    if (state > 0) {
      state--;
    }
  }

  void reset() {
    state = 0;
  }
}

final stepProvider = StateNotifierProvider<StepController, int>((ref) {
  return StepController();
});
