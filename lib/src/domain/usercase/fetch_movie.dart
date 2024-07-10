import '../core/base_failure.dart';
import '../core/result.dart';
import '../core/usecase.dart';
import '../entity/movie.dart';
import '../repository/movie_repository.dart';

class FetchMovie implements Usercase<String> {
  final MovieRepository _repository;

  FetchMovie({required MovieRepository repository}) : _repository = repository;
  @override
  Future<Result<Movie, BaseFailure>> execute(id) async {
    final response = await _repository.getMovie(id);
    return response.match(
      (value) => Success(value),
      (error) => Failure(error),
    );
  }
}
