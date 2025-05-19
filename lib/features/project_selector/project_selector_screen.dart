import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_package/global/button_util.dart';
import 'package:integration_package/features/project_selector/project_picker_util.dart';
import '../../global/consts.dart';
import 'project_path_provider.dart';

class ProjectSelectorScreen extends ConsumerWidget {
  const ProjectSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectPath = ref.watch(projectPathProvider);

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration:
          BoxDecoration(border: Border.all(width: 0.5), color: borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyButton(
              text: "Choose Flutter project",
              onPressed: () async {
                final selectedPath = await pickDirectory();
                if (selectedPath != null) {
                  ref.read(projectPathProvider.notifier).setPath(selectedPath);
                } else {
                  ref.read(projectPathProvider.notifier).setPath('invalid');
                }
              }),
          const SizedBox(height: 20),
          Text(
            projectPath == null
                ? 'No project selected'
                : projectPath == 'invalid'
                    ? 'Not a valid Flutter project (missing pubspec.yaml)'
                    : 'The project selected is: $projectPath',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
