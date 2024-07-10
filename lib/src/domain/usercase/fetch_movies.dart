import '../entity/movie.dart';
import '../core/error.dart';
import '../repository/movie_repository.dart';
import '../core/result.dart';
import '../core/usecase.dart';

class FetchMovies implements Usercase<void> {
  final MovieRepository _repository;

  FetchMovies({required MovieRepository repository}) : _repository = repository;

  @override
  Future<Result<List<Movie>, BaseError>> execute(_) async {
    final response = await _repository.getMovies();
    return response.match(
      (value) => Success(value),
      (error) => Failure(error),
    );
  }
}
