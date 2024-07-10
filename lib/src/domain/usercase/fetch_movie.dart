import '../entity/movie.dart';
import '../core/error.dart';
import '../core/repository/movie_repository.dart';
import '../core/result.dart';
import '../core/usecase.dart';

class FetchMovie implements Usercase<String> {
  final MovieRepository _repository;

  FetchMovie({required MovieRepository repository}) : _repository = repository;
  @override
  Future<Result<Movie, BaseError>> execute(id) async {
    final response = await _repository.getMovie(id);
    return response.match(
      (value) => Success(value),
      (error) => Failure(error),
    );
  }
}
