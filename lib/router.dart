import 'package:go_router/go_router.dart';

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
