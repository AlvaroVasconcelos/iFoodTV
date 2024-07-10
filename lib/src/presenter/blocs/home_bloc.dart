import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../../domain/core/base_failure.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageInProgress extends HomePageState {}

class HomePageSuccess extends HomePageState {
  final List<Movie> movies;

  HomePageSuccess({required this.movies});
}

class HomePageFailure extends HomePageState {
  final BaseFailure error;

  HomePageFailure({required this.error});
}

class HomeBloc extends ValueNotifierPlus<HomePageState> {
  final MovieRepository _repository;
  HomeBloc(super.initialState, {required MovieRepository repository})
      : _repository = repository;

  factory HomeBloc.initial({required MovieRepository repository}) =>
      HomeBloc(HomePageInitial(), repository: repository);

  void fetchMovies() {
    value = HomePageInProgress();
    _repository.getMovies().then((result) {
      result.match(
        (movies) {
          value = HomePageSuccess(movies: movies);
        },
        (error) {
          value = HomePageFailure(error: error);
        },
      );
    }).catchError((error) {
      value = HomePageFailure(
        error: MovieFailure(
          code: 'HomeBloc',
          description: 'fetchMovies.catchError: $error',
        ),
      );
    });
  }
}
