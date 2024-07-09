import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'download_view.dart';
import 'home_view.dart';
import 'pages/base_page.dart';
import 'pages/onboarding_page.dart';
import 'search_view.dart';
import 'trailer_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  final _router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: 'Onboarding',
        builder: (context, state) => OnboardingPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BasePage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: 'Search',
                builder: (context, state) => const SearchView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/download',
                name: 'Download',
                builder: (context, state) => const DownloadView(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/trailer',
        name: 'Trailer',
        builder: (context, state) => const TrailerView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
