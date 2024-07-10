import '../core/entity.dart';

class Movie extends Entity {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final List<String> images;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.images,
  });

  @override
  List<Object?> get props => [id, title, description, thumbnail, images];
}
