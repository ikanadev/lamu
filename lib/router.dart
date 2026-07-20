import 'package:go_router/go_router.dart';

import 'package:lamu/screens/product_variants/product_variants_screen.dart';
import 'package:lamu/screens/products/products_screen.dart';
import 'package:lamu/screens/sample/sample_screen.dart';
import 'package:lamu/widgets/app_shell.dart';

final router = GoRouter(
  initialLocation: '/products',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/products',
              builder: (context, state) => const ProductsScreen(),
              routes: [
                // Nested, so it pushes inside the Productos branch and the
                // navigation bar stays put.
                GoRoute(
                  path: 'variants',
                  builder: (context, state) => const ProductVariantsScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/sample',
              builder: (context, state) => const SampleScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
