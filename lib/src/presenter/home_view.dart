import 'package:flutter/material.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../domain/repository/movie_repository.dart';
import 'blocs/home_bloc.dart';
import 'pages/home_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlusProvider(
      provider: HomeBloc.initial(
        repository: context.of<MovieRepository>(),
      ),
      builder: (context) => HomePage(bloc: context.of()),
    );
  }
}
