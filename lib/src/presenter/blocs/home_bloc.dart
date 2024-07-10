import 'package:ifoodtv/src/domain/core/base_error.dart';
import 'package:ifoodtv/src/domain/repository/movie_repository.dart';
import 'package:value_notifier_plus/value_notifier_plus.dart';

import '../../domain/entity/movie.dart';

abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  final List<Movie> movies;

  HomePageLoadedState({required this.movies});
}

class HomePageErrorState extends HomePageState {
  final BaseError error;

  HomePageErrorState({required this.error});
}

class HomeBloc extends ValueNotifierPlus<HomePageState> {
  final MovieRepository _repository;
  HomeBloc(super.initialState, {required MovieRepository repository})
      : _repository = repository;

  factory HomeBloc.initial({required MovieRepository repository}) =>
      HomeBloc(HomePageInitialState(), repository: repository);

  void fetchMovies() {
    value = HomePageLoadingState();
    _repository.getMovies().then((result) {
      result.match((movies) {
        value = HomePageLoadedState(movies: movies);
      }, (error) {
        value = HomePageErrorState(error: error);
      });
    }).catchError((error) {
      value = HomePageErrorState(error: error);
    });
  }
}
