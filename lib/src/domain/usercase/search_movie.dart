import '../core/base_failure.dart';
import '../core/result.dart';
import '../core/usecase.dart';
import '../entity/movie.dart';
import '../repository/movie_repository.dart';

class SearchMovie implements Usercase<String> {
  final MovieRepository _repository;

  SearchMovie({required MovieRepository repository}) : _repository = repository;
  @override
  Future<Result<List<Movie>, BaseFailure>> execute(term) async {
    final response = await _repository.searchMovie(term);
    return response.match(
      (value) => Success(value),
      (error) => Failure(error),
    );
  }
}
