import 'package:flutter/material.dart';

import 'package:lamu/domain/models/sale_line.dart';

/// The one-line face of a collapsed block: flavour · size · quantity, showing
/// only what has been chosen so far.
class CollapsedSummary extends StatelessWidget {
  const CollapsedSummary({super.key, required this.line});

  final SaleLine line;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final parts = [
      if (line.flavor != null) line.flavor!.name,
      if (line.size != null) line.size!.name,
      '×${line.quantity}',
    ];
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        parts.join('  ·  '),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
