import 'package:go_router/go_router.dart';

import 'package:lamu/screens/home/home_screen.dart';
import 'package:lamu/screens/sample/sample_screen.dart';
import 'package:lamu/widgets/app_shell.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
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
