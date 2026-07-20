import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/utils/app_theme.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        children: [
          Text('Productos', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
