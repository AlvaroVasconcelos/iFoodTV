import '../../entity/movie.dart';
import '../error.dart';
import '../result.dart';
import 'repository.dart';

abstract class MovieRepository extends Repository {
  Future<Result<Movie, BaseError>> getMovie(String id);
  Future<Result<List<Movie>, BaseError>> getMovies();
  Future<Result<List<Movie>, BaseError>> searchMovie(String term);
}
