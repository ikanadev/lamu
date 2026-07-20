import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/widgets/empty_section.dart';

/// Placeholder. Will edit the sellable combinations — product, size, flavor —
/// and their extras. Products themselves are fixed and not edited here.
class ProductVariantsScreen extends ConsumerWidget {
  const ProductVariantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Variantes')),
      body: const EmptySection(text: 'Aún no hay nada por aquí.'),
    );
  }
}
