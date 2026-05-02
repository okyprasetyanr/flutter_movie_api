import 'package:flutte_movie_api/model_data/model_movie.dart';
import 'package:flutte_movie_api/model_data/model_movie_list.dart';

ModelMovie fromJsonMovie(Map<String, dynamic> data) {
  return ModelMovie(
    page: data['page'],
    movieList: (data['results'] as List<dynamic>)
        .map((e) => fromJsonMovieList(e))
        .toList(),
    total_page: data['total_pages'],
    total_result: data['total_results'],
  );
}

ModelMovieList fromJsonMovieList(Map<String, dynamic> data) {
  return ModelMovieList(
    description: data['description'],
    favorite_count: data['favorite_count'],
    id: data['id'],
    item_count: data['item_count'],
    iso: data['iso'],
    list_type: data['list_type'],
    name: data['name'],
    poster_path: data['poster_path'],
  );
}
