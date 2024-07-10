import '../core/base_failure.dart';
import '../core/result.dart';
import '../core/usecase.dart';
import '../entity/movie.dart';
import '../repository/movie_repository.dart';

class FetchMovies implements Usercase<void> {
  final MovieRepository _repository;

  FetchMovies({required MovieRepository repository}) : _repository = repository;

  @override
  Future<Result<List<Movie>, BaseFailure>> execute(_) async {
    final response = await _repository.getMovies();
    return response.match(
      (value) => Success(value),
      (error) => Failure(error),
    );
  }
}
