import '../../domain/entity/movie.dart';

sealed class MovieAdapter {
  static Movie fromJson(Map<String, dynamic> data) {
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
  }

  static List<Movie> fromJsonList(Map<String, dynamic> data) {
    return (data['results'] as List).map((e) => fromJson(e)).toList();
  }

  static String addBackdropBaseUrl(String url) {
    return 'https://image.tmdb.org/t/p/original$url';
  }

  static String addPosterBaseUrl(String url) {
    return 'https://image.tmdb.org/t/p/w500$url';
  }
}
