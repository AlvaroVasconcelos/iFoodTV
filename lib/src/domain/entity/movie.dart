import '../core/entity.dart';

class Movie extends Entity {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final String image;
  final bool isAdult;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.isAdult,
    required this.image,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        thumbnail,
        isAdult,
        image,
        releaseDate,
        voteAverage,
        voteCount,
      ];
}
