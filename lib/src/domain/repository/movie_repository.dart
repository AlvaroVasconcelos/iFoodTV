import '../entity/movie.dart';
import '../core/base_error.dart';
import '../core/result.dart';
import '../core/repository.dart';

abstract class MovieRepository extends Repository {
  Future<Result<Movie, MovieError>> getMovie(String id);
  Future<Result<List<Movie>, MovieError>> getMovies();
  Future<Result<List<Movie>, MovieError>> searchMovie(String term);
}

class MovieError extends BaseError {
  MovieError({required super.code, required super.description});
}
