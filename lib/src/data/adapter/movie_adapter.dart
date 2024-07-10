import '../../core/entity/movie.dart';

sealed class MovieAdapter {
  static Movie fromJson(Map<String, dynamic> data) {
    return Movie(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
      images: data['images'],
    );
  }

  static List<Movie> fromJsonList(Map<String, dynamic> data) {
    return data.entries
        .toList()
        .cast<Map<String, dynamic>>()
        .map(fromJson)
        .toList();
  }
}
