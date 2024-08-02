import 'dart:async';

import 'package:client/pages/home-page/home_page.dart';
import 'package:client/pages/login-page/login_page.dart';
import 'package:client/pages/main-screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LoginPage();
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return MainScreen();
            },
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );

  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _router.go(uri.toString());
      }
    }, onError: (Object err) {
      // Handle errors
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Deep Linking Example',
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
