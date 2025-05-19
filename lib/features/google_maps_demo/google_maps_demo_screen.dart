import 'package:flutter/material.dart';
import 'package:integration_package/global/button_util.dart';
import '../../global/consts.dart';
import 'google_maps_demo_provider.dart';
import 'google_maps_demo_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoogleMapsDemoScreen extends ConsumerWidget {
  const GoogleMapsDemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultMessageShown = ref.watch(resultMessageDemoProvider);
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration:
          BoxDecoration(border: Border.all(width: 0.5), color: borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyButton(
            onPressed: () async {
              String resultMessage = await addDemoOnMainClass();
              ref.read(resultMessageDemoProvider.notifier).state =
                  resultMessage;
            },
            text: "add Demo example",
          ),
          const SizedBox(height: 20),
          Text(
            resultMessageShown,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
