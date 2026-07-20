import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lamu/domain/providers/app/app_state_provider.dart';
import 'package:lamu/domain/providers/sales/today_earnings_provider.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/utils/money.dart';
import 'package:lamu/widgets/money_text.dart';

/// Today's takings on the left, the screen's actions on the right.
class EarningsHeader extends ConsumerWidget {
  const EarningsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final earningsValue = ref.watch(todayEarningsProvider);
    final hidden = ref.watch(appStateProvider).hideEarnings;

    return Row(
      children: [
        Text('Hoy:', style: theme.textTheme.titleMedium),
        const SizedBox(width: AppSpacing.s8),
        Expanded(
          child: earningsValue.when(
            data: (cents) =>
                MoneyText(cents, style: theme.textTheme.titleMedium),
            // The amount is one line among many; the mask placeholder stands in
            // while loading, quieter than a spinner, and marks an error by
            // color. MoneyText isn't used here — it would render a real-looking
            // Bs 0.00 rather than a "not ready" state.
            loading: () => Text(
              Money.maskedWithSymbol,
              style: theme.textTheme.titleMedium?.copyWith(
                fontFamily: 'monospace',
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            error: (_, _) => Text(
              Money.maskedWithSymbol,
              style: theme.textTheme.titleMedium?.copyWith(
                fontFamily: 'monospace',
                color: theme.colorScheme.error,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () =>
              ref.read(appStateProvider.notifier).toggleHideEarnings(),
          tooltip: hidden ? 'Mostrar ganancias' : 'Ocultar ganancias',
          visualDensity: VisualDensity.compact,
          iconSize: 20,
          icon: Icon(hidden ? Icons.visibility_off : Icons.visibility),
        ),
        IconButton(
          onPressed: () => context.go('/products/variants'),
          tooltip: 'Variantes',
          visualDensity: VisualDensity.compact,
          iconSize: 20,
          icon: const Icon(Icons.tune),
        ),
      ],
    );
  }
}
