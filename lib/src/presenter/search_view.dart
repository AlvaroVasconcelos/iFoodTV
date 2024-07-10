import 'package:flutter/material.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../domain/repository/movie_repository.dart';
import 'blocs/search_bloc.dart';
import 'pages/search_page.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlusProvider(
      provider: SearchBloc.initial(context.of<MovieRepository>()),
      builder: (context) => SearchPage(bloc: context.of()),
    );
  }
}
