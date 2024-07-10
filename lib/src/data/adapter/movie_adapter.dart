import 'package:logging/logging.dart';

import '../../domain/entity/movie.dart';

sealed class MovieAdapter {
  static final _log = Logger('MovieAdapter');

  static Movie fromJson(Map<String, dynamic> data) {
    try {
      return Movie(
        id: data['id'],
        title: data["original_title"],
        description: data["overview"],
        thumbnail: addPosterBaseUrl(data["poster_path"]),
        image: addBackdropBaseUrl(data['backdrop_path']),
        isAdult: data['adult'],
        releaseDate: data['release_date'],
        voteAverage: data['vote_average'],
        voteCount: data['vote_count'],
      );
    } catch (e, s) {
      _log.severe('fromJson', e, s);
      rethrow;
    }
  }

  static List<Movie> fromJsonList(Map<String, dynamic> data) {
    try {
      final movies = (data['results'] as List).map((e) => fromJson(e)).toList();
      return movies;
    } catch (e, s) {
      _log.severe('fromJsonList', e, s);
      rethrow;
    }
  }

  static String addBackdropBaseUrl(String? url) {
    if (url == null) {
      return '';
    }
    return 'https://image.tmdb.org/t/p/original$url';
  }

  static String addPosterBaseUrl(String? url) {
    if (url == null) {
      return '';
    }
    return 'https://image.tmdb.org/t/p/w500$url';
  }
}
