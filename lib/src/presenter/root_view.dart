import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';
import '../data/client/tmdb_client.dart';
import '../data/repository/tmdb_repository.dart';
import '../domain/repository/movie_repository.dart';

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

  @override
  Widget build(BuildContext context) {
    return PlusProvider<MovieRepository>(
      provider: TmdbRepository(
        client: TmdbClient(
          ApiKeys(
            '276be352e26dce08659ffda428f7b517',
            'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzZiZTM1MmUyNmRjZTA4NjU5ZmZkYTQyOGY3YjUxNyIsIm5iZiI6MTcyMDYzMTQ1Mi43NDAzOTUsInN1YiI6IjY2OGNiNTBkMGViMDZkZDM1ZGYzNTliMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.emWaTIQwO-HmdHSd2abpfbHQFFNwvvkExvAwacJV1N4',
          ),
        ),
      ),
      builder: (context) => MaterialApp.router(
        routerConfig: GoRouter(
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
        ),
      ),
    );
  }
}
