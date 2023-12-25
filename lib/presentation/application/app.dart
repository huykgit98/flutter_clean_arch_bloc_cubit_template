import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/common/connectivity/network_state_change.dart';
import 'package:flutter_starter/common/helpers/injection_container.dart';
import 'package:flutter_starter/config/themes/themes.dart';
import 'package:flutter_starter/gen/fonts.gen.dart';
import 'package:flutter_starter/presentation/application/router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

mixin RouterObserver {
  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  static RouteObserver<Route> normalRouteObserver = RouteObserver<Route>();
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const MyApp({Key? key, this.navigatorKey}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _networkStateChange = di<NetworkStateChange>();

  @override
  initState() {
    super.initState();
    _networkStateChange.initNetworkChange();
  }

  @override
  dispose() {
    super.dispose();
    _networkStateChange.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        child = ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ]);
        child = BotToastInit()(context, child);
        return child;
      },
      navigatorObservers: [RouterObserver.routeObserver, BotToastNavigatorObserver()],
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          primaryColor: Palette.primary,
          fontFamily: FontFamily.sourceSansProRegular,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontFamily: FontFamily.ralewayRegular, color: Colors.white),
              backgroundColor: Palette.primary),
          dialogTheme: const DialogTheme(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(BorderRadiusSize.medium))))),
      initialRoute: RoutePaths.splash,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: widget.navigatorKey,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
