import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frugalistic/version/package_info.dart';

class VersionText extends ConsumerWidget {
  const VersionText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var packageInfo = ref.watch(packageInfoProvider);
    switch (packageInfo) {
      case AsyncData(:final value):
        return Column(
          children: [
            Text("Made with 💛 by Alexander Hofmeister"),
            Text(value.appName),
            Text("${value.version}+${value.buildNumber}"),
          ],
        );
      case AsyncError(:final error):
        return Text('error: $error');
      default:
        return const Text('Loading');
    }
  }
}
