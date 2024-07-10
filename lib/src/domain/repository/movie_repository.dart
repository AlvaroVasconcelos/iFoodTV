import '../entity/movie.dart';
import '../core/base_failure.dart';
import '../core/result.dart';
import '../core/repository.dart';

abstract class MovieRepository extends Repository {
  Future<Result<Movie, MovieFailure>> getMovie(String id);
  Future<Result<List<Movie>, MovieFailure>> getMovies();
  Future<Result<List<Movie>, MovieFailure>> searchMovie(String term);
}

class MovieFailure extends BaseFailure {
  MovieFailure({required super.code, required super.description});
}
