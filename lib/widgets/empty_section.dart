import 'package:flutter/material.dart';

import 'package:lamu/utils/app_theme.dart';

class EmptySection extends StatelessWidget {
  const EmptySection({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
      child: Center(
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
