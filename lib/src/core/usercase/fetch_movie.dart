import '../entity/movie.dart';
import '../error/error.dart';
import '../repository/movie_repository.dart';
import 'result.dart';
import 'usecase.dart';

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
