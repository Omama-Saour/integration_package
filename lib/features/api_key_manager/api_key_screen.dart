import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_package/global/button_util.dart';
import '../../global/consts.dart';
import 'api_key_provider.dart';
import 'api_key_utils.dart';

class ApiKeyManagerScreen extends ConsumerWidget {
  const ApiKeyManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultMessageShown = ref.watch(resultMessageProvider);
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration:
          BoxDecoration(border: Border.all(width: 0.5), color: borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Add API key',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 36,
                  child: TextField(
                    onChanged: (value) {
                      ref.read(apiKeyProvider.notifier).setApiKey(value);
                    },
                    cursorHeight: 16,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 12),
                      labelText: 'API key',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              MyButton(
                onPressed: () async {
                  final key = ref.read(apiKeyProvider);
                  if (key != null && key.isNotEmpty) {
                    final resultMessage = await saveApiKey(key);
                    ref.read(resultMessageProvider.notifier).state =
                        resultMessage;
                  } else {
                    ref.read(resultMessageProvider.notifier).state =
                        "Please add a availed API key";
                  }
                },
                text: "Save API key",
              ),
            ],
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
