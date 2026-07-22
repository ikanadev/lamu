import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lamu/utils/money.dart';

/// Numeric dialog for overriding the final charged amount. Pops the new amount
/// in **cents**, or null when cancelled or left blank/invalid.
class OverrideTotalDialog extends StatefulWidget {
  const OverrideTotalDialog({super.key, required this.initialCents});

  final int initialCents;

  @override
  State<OverrideTotalDialog> createState() => _OverrideTotalDialogState();
}

class _OverrideTotalDialogState extends State<OverrideTotalDialog> {
  late final TextEditingController _controller =
      TextEditingController(text: Money.format(widget.initialCents));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    final value = double.tryParse(_controller.text.trim());
    // Blank or malformed -> treat as cancel; the caller keeps the current total.
    Navigator.of(context).pop(
      value == null || value < 0 ? null : (value * 100).round(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ajustar total'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        decoration: const InputDecoration(prefixText: 'Bs ', hintText: '0.00'),
        onSubmitted: (_) => _save(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(onPressed: _save, child: const Text('Guardar')),
      ],
    );
  }
}
