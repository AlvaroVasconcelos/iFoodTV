import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../../domain/core/base_failure.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';

abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageInProgressState extends HomePageState {}

class HomePageSuccessState extends HomePageState {
  final List<Movie> movies;

  HomePageSuccessState({required this.movies});
}

class HomePageFailureState extends HomePageState {
  final BaseFailure error;

  HomePageFailureState({required this.error});
}

class HomeBloc extends ValueNotifierPlus<HomePageState> {
  final MovieRepository _repository;
  HomeBloc(super.initialState, {required MovieRepository repository})
      : _repository = repository;

  factory HomeBloc.initial({required MovieRepository repository}) =>
      HomeBloc(HomePageInitialState(), repository: repository);

  void fetchMovies() {
    value = HomePageInProgressState();
    _repository.getMovies().then((result) {
      result.match(
        (movies) {
          value = HomePageSuccessState(movies: movies);
        },
        (error) {
          value = HomePageFailureState(error: error);
        },
      );
    }).catchError((error) {
      value = HomePageFailureState(
        error: MovieFailure(
          code: 'HomeBloc',
          description: 'fetchMovies.catchError: $error',
        ),
      );
    });
  }
}
