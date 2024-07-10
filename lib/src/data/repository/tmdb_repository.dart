import 'package:logging/logging.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/core/result.dart';
import '../adapter/movie_adapter.dart';
import '../client/tmdb_client.dart';

class TmdbRepository extends MovieRepository {
  final TmdbClient _client;
  final _log = Logger('TmdbRepository');

  TmdbRepository({required TmdbClient client}) : _client = client;

  @override
  Future<Result<List<Movie>, MovieFailure>> getMovies() async {
    try {
      final response = await _client.v3.discover.getMovies();
      final movies = MovieAdapter.fromJsonList(
        response as Map<String, dynamic>,
      );
      return Success(movies);
    } catch (e, s) {
      _log.severe('getMovies', e, s);
      return Failure(
        MovieFailure(
          code: 'TmdbRepository',
          description: 'getMovies: $e',
        ),
      );
    }
  }

  @override
  Future<Result<Movie, MovieFailure>> getMovie(String id) async {
    try {
      final response = await _client.v3.find.getById(id);
      final movie = MovieAdapter.fromJson(
        response['data'] as Map<String, dynamic>,
      );
      return Success(movie);
    } catch (e, s) {
      _log.severe('getMovie', e, s);
      return Failure(
        MovieFailure(
          code: 'TmdbRepository',
          description: 'getMovie: $e',
        ),
      );
    }
  }

  @override
  Future<Result<List<Movie>, MovieFailure>> searchMovie(String term) async {
    try {
      final response = await _client.v3.search.queryMovies(term);
      final movies = MovieAdapter.fromJsonList(
        response['data'] as Map<String, dynamic>,
      );
      return Success(movies);
    } catch (e, s) {
      _log.severe('searchMovie', e, s);
      return Failure(
        MovieFailure(
          code: 'TmdbRepository',
          description: 'searchMovie: $e',
        ),
      );
    }
  }
}
