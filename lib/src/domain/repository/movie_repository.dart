import '../entity/movie.dart';
import '../core/error.dart';
import '../core/result.dart';
import '../core/repository.dart';

abstract class MovieRepository extends Repository {
  Future<Result<Movie, BaseError>> getMovie(String id);
  Future<Result<List<Movie>, BaseError>> getMovies();
  Future<Result<List<Movie>, BaseError>> searchMovie(String term);
}
