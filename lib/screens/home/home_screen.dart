import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/providers/app/app_state_provider.dart';
import 'package:lamu/utils/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        children: [
          Text('Hello, world', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.s12),
          SwitchListTile(
            title: const Text('Sample flag (persisted)'),
            value: appState.sampleFlag,
            onChanged: (_) =>
                ref.read(appStateProvider.notifier).toggleSampleFlag(),
          ),
        ],
      ),
    );
  }
}
