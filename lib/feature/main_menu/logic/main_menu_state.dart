import 'package:equatable/equatable.dart';
import 'package:flutte_movie_api/model_data/model_movie.dart';
import 'package:flutte_movie_api/model_data/model_movie_list.dart';

class MainMenuState {}

class MainMenuInitial extends MainMenuState {}

class MainMenuLoaded extends MainMenuState with EquatableMixin {
  final ModelMovie? dataMovie;
  final List<ModelMovieList> dataMovieList;

  MainMenuLoaded({this.dataMovie, this.dataMovieList = const []});

  MainMenuLoaded copyWith({
    ModelMovie? dataMovie,
    List<ModelMovieList>? dataMovieList,
  }) {
    return MainMenuLoaded(
      dataMovie: dataMovie ?? this.dataMovie,
      dataMovieList: dataMovieList ?? this.dataMovieList,
    );
  }

  @override
  List<Object?> get props => [dataMovie, dataMovieList];
}
