import '../entity/movie.dart';
import '../error/error.dart';
import '../usercase/result.dart';
import 'repository.dart';

abstract class MovieRepository extends Repository {
  Future<Result<Movie, BaseError>> getMovie(String id);
  Future<Result<List<Movie>, BaseError>> getAllMovie();
  Future<Result<List<Movie>, BaseError>> searchMovie(String term);
}
