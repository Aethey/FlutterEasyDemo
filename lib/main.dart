import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:select_one/application.dart';
import 'package:select_one/generated/l10n.dart';
import 'package:select_one/routes/main_routes.dart';
import 'package:select_one/service/local/hive_db.dart';
import 'package:select_one/theme/flex_scheme_notifier.dart';
import 'package:select_one/widget/simple/show_page.dart';

void main() async {
  // use it when init need async process
  WidgetsFlutterBinding.ensureInitialized();

  // init DB
  // await HiveDB.initHive();
  // init route
  final router = FluroRouter();
  Routes.defineRoutes(router);
  Application.router = router;
  runApp(
    ProviderScope(
      child: MyApp(
        router: router,
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final FluroRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);
    // UI display a reasonable
    // https://pub.dev/packages/flutter_screenutil
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          title: 'SelectOne',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generator,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: FlexThemeData.light(scheme: themeNotifier.scheme),
          darkTheme: FlexThemeData.dark(scheme: themeNotifier.scheme),
          themeMode: ThemeMode.system,
          home: child,
        );
      },
      child: ThemeTestPage(),
    );
  }
}
