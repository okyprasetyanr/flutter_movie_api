import 'package:equatable/equatable.dart';
import 'package:flutte_movie_api/model_data/model_movie_list.dart';

class ModelMovie extends Equatable {
  final int page;
  final List<ModelMovieList> movieList;
  final int total_page;
  final int total_result;

  ModelMovie({
    required this.page,
    required this.movieList,
    required this.total_page,
    required this.total_result,
  });

  @override
  List<Object?> get props => [page, movieList, total_page, total_result];
}
