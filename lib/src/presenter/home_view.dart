import 'package:flutter/material.dart';
import 'package:ifoodtv/src/data/client/tmdb_client.dart';
import 'package:ifoodtv/src/data/repository/tmdb_repository.dart';
import 'package:ifoodtv/src/presenter/blocs/home_bloc.dart';
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
              'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzZiZTM1MmUyNmRjZTA4NjU5ZmZkYTQyOGY3YjUxNyIsIm5iZiI6MTcyMDQ5Nzc0NS4zNjQ2ODYsInN1YiI6IjY2OGNiNTBkMGViMDZkZDM1ZGYzNTliMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Txc9XPeNXd-sGN75nWnxmvaGPNvWC9T1jou5G6UJsAQ',
              'apiReadAccessTokenv4',
            ),
          ),
        ),
      ),
      child: HomePage(),
    );
  }
}
