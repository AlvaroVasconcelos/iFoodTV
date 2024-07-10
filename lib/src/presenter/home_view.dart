import 'package:flutter/material.dart';
import '../data/client/tmdb_client.dart';
import '../data/repository/tmdb_repository.dart';
import 'blocs/home_bloc.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';

import 'pages/home_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueNotifierPlusProvider(
      notifier: HomeBloc.initial(
        repository: TmdbRepository(
          client: TmdbClient(
            ApiKeys(
              '276be352e26dce08659ffda428f7b517',
              'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzZiZTM1MmUyNmRjZTA4NjU5ZmZkYTQyOGY3YjUxNyIsIm5iZiI6MTcyMDYzMTQ1Mi43NDAzOTUsInN1YiI6IjY2OGNiNTBkMGViMDZkZDM1ZGYzNTliMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.emWaTIQwO-HmdHSd2abpfbHQFFNwvvkExvAwacJV1N4',
            ),
          ),
        ),
      ),
      builder: (context) {
        return HomePage(bloc: context.of<HomeBloc>()!);
      },
    );
  }
}
