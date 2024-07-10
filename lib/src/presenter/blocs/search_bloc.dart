import 'package:ifoodtv/src/domain/core/base_failure.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Movie> movies;

  SearchSuccess({required this.movies});
}

class SearchFailure extends SearchState {
  final BaseFailure failure;

  SearchFailure({required this.failure});
}

class SearchBloc extends ValueNotifierPlus<SearchState> {
  final MovieRepository _repository;
  SearchBloc(super.initialState, {required MovieRepository repository})
      : _repository = repository;

  factory SearchBloc.initial(MovieRepository repository) =>
      SearchBloc(SearchInitial(), repository: repository);

  void searchMovie(String query) {
    if (query.length < 3) return;
    value = SearchInProgress();
    _repository.searchMovie(query).then((result) {
      value = result.match(
        (movies) => SearchSuccess(movies: movies),
        (failure) => SearchFailure(failure: failure),
      );
    }).catchError(
      (error) {
        value = SearchFailure(
          failure: MovieFailure(
            code: 'SearchBloc',
            description: 'searchMovie.catchError: $error',
          ),
        );
      },
    );
  }
}
