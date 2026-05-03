import 'package:equatable/equatable.dart';

class ModelMovieList extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? releaseDate;
  final double voteAverage;
  final int voteCount;

  ModelMovieList({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    id,
    title,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    voteAverage,
    voteCount,
  ];
}
