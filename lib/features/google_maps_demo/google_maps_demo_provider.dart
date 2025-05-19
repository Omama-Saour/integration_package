import 'package:flutter_riverpod/flutter_riverpod.dart';

final resultMessageDemoProvider = StateProvider<String>((ref) {
  return "Just click 'Finish' if you want to skip this step.";
});