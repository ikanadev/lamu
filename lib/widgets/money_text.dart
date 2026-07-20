import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/providers/app/app_state_provider.dart';
import 'package:lamu/utils/money.dart';

/// Renders a cents amount as `Bs 18.00`, in a monospace so digits line up and
/// the width doesn't jump as the value changes.
///
/// Honors the app-wide hide-earnings preference: when set, it shows the mask
/// instead of the figure. Every place that displays money should go through
/// here so that one toggle covers the whole app.
class MoneyText extends ConsumerWidget {
  const MoneyText(this.cents, {super.key, this.style});

  final int cents;

  /// Merged over the monospace defaults — pass a text-theme style for size and
  /// color; the monospace family is forced on regardless.
  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidden = ref.watch(appStateProvider.select((s) => s.hideEarnings));

    return Text(
      hidden ? Money.maskedWithSymbol : Money.formatWithSymbol(cents),
      style: (style ?? const TextStyle()).copyWith(fontFamily: 'monospace'),
    );
  }
}
