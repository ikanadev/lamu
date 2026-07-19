import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/providers/samples/sample_actions_provider.dart';
import 'package:lamu/domain/providers/samples/samples_provider.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/widgets/empty_section.dart';
import 'package:lamu/widgets/error_section.dart';

class SampleScreen extends ConsumerWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final samplesValue = ref.watch(samplesProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref
            .read(sampleActionsProvider.notifier)
            .createSample(name: 'Sample ${DateTime.now().second}'),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(samplesProvider.future),
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.s16),
          children: [
            Text('Samples', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: AppSpacing.s12),
            samplesValue.when(
              data: (samples) {
                if (samples.isEmpty) {
                  return const EmptySection(text: 'No samples yet.');
                }
                return Column(
                  children: [
                    for (final sample in samples)
                      ListTile(
                        key: ValueKey(sample.id),
                        title: Text(sample.name),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => ref
                              .read(sampleActionsProvider.notifier)
                              .deleteSample(id: sample.id),
                        ),
                      ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, _) => const ErrorSection(text: 'Could not load samples.'),
            ),
          ],
        ),
      ),
    );
  }
}
