import 'package:tmdb_api/tmdb_api.dart';

import '../../domain/entity/movie.dart';
import '../../domain/core/error.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/core/result.dart';
import '../adapter/movie_adapter.dart';
import '../client/tmdb_client.dart';

final client = TMDB(
  ApiKeys(
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzZiZTM1MmUyNmRjZTA4NjU5ZmZkYTQyOGY3YjUxNyIsIm5iZiI6MTcyMDQ5Nzc0NS4zNjQ2ODYsInN1YiI6IjY2OGNiNTBkMGViMDZkZDM1ZGYzNTliMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Txc9XPeNXd-sGN75nWnxmvaGPNvWC9T1jou5G6UJsAQ',
    'apiReadAccessTokenv4',
  ),
  logConfig: const ConfigLogger.showAll(),
);

class TmdbRepository extends MovieRepository {
  final TmdbClient _client;

  TmdbRepository({required TmdbClient client}) : _client = client;

  @override
  Future<Result<List<Movie>, BaseError>> getMovies() async {
    final response = await _client.v3.discover.getMovies();
    final movies = MovieAdapter.fromJsonList(
      response['data'] as Map<String, dynamic>,
    );
    return Success(movies);
  }

  @override
  Future<Result<Movie, BaseError>> getMovie(String id) async {
    final response = await _client.v3.find.getById(id);
    final movie = MovieAdapter.fromJson(
      response['data'] as Map<String, dynamic>,
    );
    return Success(movie);
  }

  @override
  Future<Result<List<Movie>, BaseError>> searchMovie(String term) async {
    final response = await _client.v3.search.queryMovies(term);
    final movies = MovieAdapter.fromJsonList(
      response['data'] as Map<String, dynamic>,
    );
    return Success(movies);
  }
}
