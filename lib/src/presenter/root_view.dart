import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'download_view.dart';
import 'home_view.dart';
import 'pages/onboarding_page.dart';
import 'search_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: '/download',
        builder: (context, state) => const DownloadView(),
      ),
      GoRoute(
        path: '/trailer',
        builder: (context, state) => const DownloadView(),
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
