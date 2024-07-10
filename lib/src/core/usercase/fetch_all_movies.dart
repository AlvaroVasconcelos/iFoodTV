import '../entity/movie.dart';
import '../error/error.dart';
import '../repository/movie_repository.dart';
import 'result.dart';
import 'usecase.dart';

class FetchAllMovies implements Usercase<void> {
  final MovieRepository _repository;

  FetchAllMovies({required MovieRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<Movie>, BaseError>> execute(_) async {
    final response = await _repository.getAllMovie();
    return response.match(
      (value) => Success(value),
      (error) => Failure(error),
    );
  }
}
