import '../entity/movie.dart';
import '../core/error.dart';
import '../repository/movie_repository.dart';
import '../core/result.dart';
import '../core/usecase.dart';

class SearchMovie implements Usercase<String> {
  final MovieRepository _repository;

  SearchMovie({required MovieRepository repository}) : _repository = repository;
  @override
  Future<Result<List<Movie>, BaseError>> execute(term) async {
    final response = await _repository.searchMovie(term);
    return response.match(
      (value) => Success(value),
      (error) => Failure(error),
    );
  }
}
