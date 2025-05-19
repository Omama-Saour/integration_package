import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_package/global/button_util.dart';
import 'package:integration_package/features/package_installer/package_installer_util.dart';
import '../../global/consts.dart';
import 'package_installer_provider.dart';

class PackageInstallerScreen extends ConsumerWidget {
  const PackageInstallerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInstalling = ref.watch(packageInstallerProvider);
    final resultMessageShown = ref.watch(resultMessageProvider);

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration:
          BoxDecoration(border: Border.all(width: 0.5), color: borderColor),
      child: isInstalling
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Installation is running...',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      minHeight: 6,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyButton(
                        text: "install Google Maps",
                        onPressed: () async {
                          ref
                              .read(packageInstallerProvider.notifier)
                              .startInstallation();

                          try {
                            String resultMessage =
                                await installGoogleMapsPackage(
                                    projectPathGlobal!);

                            ref.read(resultMessageProvider.notifier).state =
                                resultMessage;
                          } catch (e) {
                            final errorText = 'Error installing: $e';
                            ref.read(resultMessageProvider.notifier).state =
                                errorText;
                          } finally {
                            ref
                                .read(packageInstallerProvider.notifier)
                                .completeInstallation();
                          }
                        }),
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
