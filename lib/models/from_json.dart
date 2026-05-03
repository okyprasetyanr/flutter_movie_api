import 'package:flutte_movie_api/function/function.dart';
import 'package:flutte_movie_api/model_data/model_movie.dart';
import 'package:flutte_movie_api/model_data/model_movie_list.dart';
import 'package:flutte_movie_api/model_data/model_movie_trailer.dart';

ModelMovie fromJsonMovie(Map<String, dynamic> data) {
  return ModelMovie(
    page: data['page'],
    movieList: (data['results'] as List<dynamic>)
        .map((e) => fromJsonMovieList(e))
        .toList(),
    totalPage: data['total_pages'],
    totalResult: data['total_results'],
  );
}

ModelMovieList fromJsonMovieList(Map<String, dynamic> data) {
  return ModelMovieList(
    adult: data['adult'],
    backdropPath: data['backdrop_path'],
    genreIds: (data['genre_ids'] as List).map((e) => e as int).toList(),
    id: data['id'],
    title: data['title'],
    originalTitle: data['original_title'],
    overview: data['overview'],
    popularity: data['popularity'],
    posterPath: data['poster_path'],
    releaseDate: data['release_date'] != null
        ? parseDate(date: data['release_date'], minute: false)
        : null,
    voteAverage: data['vote_average'],
    voteCount: data['vote_count'],
  );
}

ModelMovieTrailer fromJsonMovieTrailer(Map<String, dynamic> data) {
  final finalData = (data['results'] as List<dynamic>).firstWhere((element) {
    final elementData = element as Map<String, dynamic>;
    return elementData['site'] == "YouTube" && elementData['type'] == 'Trailer';
  });
  return ModelMovieTrailer(
    name: finalData['name'],
    key: finalData['key'],
    site: finalData['site'],
    type: finalData['type'],
  );
}
