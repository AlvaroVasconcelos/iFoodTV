import '../entity/movie.dart';
import '../error/error.dart';
import '../repository/movie_repository.dart';
import 'result.dart';
import 'usecase.dart';

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
