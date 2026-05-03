import 'package:equatable/equatable.dart';
import 'package:flutte_movie_api/model_data/model_movie_list.dart';

class ModelMovie extends Equatable {
  final int page;
  final List<ModelMovieList> movieList;
  final int totalPage;
  final int totalResult;

  const ModelMovie({
    required this.page,
    required this.movieList,
    required this.totalPage,
    required this.totalResult,
  });

  @override
  List<Object?> get props => [page, movieList, totalPage, totalResult];
}
