import 'package:flutter/material.dart';

/// A dumb −/value/+ stepper. The floor (quantity ≥ 1) is enforced by the
/// notifier; here [onDecrement] is simply disabled at 1.
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text('Cantidad', style: theme.textTheme.bodyMedium),
        const Spacer(),
        IconButton.outlined(
          onPressed: quantity > 1 ? onDecrement : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 40,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium,
          ),
        ),
        IconButton.outlined(
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
