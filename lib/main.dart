import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lamu/domain/models/prefs_keys.dart';
import 'package:lamu/domain/providers/app/shared_prefs_provider.dart';
import 'package:lamu/router.dart';
import 'package:lamu/utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: {PrefsKeys.sampleFlag, PrefsKeys.hideEarnings},
    ),
  );

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dark-only by design. Wallpaper-derived scheme on Android 12+,
    // seeded fallback elsewhere.
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp.router(
        title: 'Lamu',
        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(
          darkDynamic ??
              ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
        ),
        routerConfig: router,
      ),
    );
  }
}
