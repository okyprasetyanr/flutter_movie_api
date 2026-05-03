import 'dart:convert';
import 'package:flutte_movie_api/function/function.dart';
import 'package:flutte_movie_api/model_data/model_movie.dart';
import 'package:flutte_movie_api/model_data/model_movie_trailer.dart';
import 'package:flutte_movie_api/models/from_json.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<ModelMovie?> fetchMovie() async {
  final res = await _url('https://api.themoviedb.org/3/movie/popular');
  if (res.statusCode == 200) {
    return fromJsonMovie(jsonDecode(res.body));
  }
  return null;
}

Future<ModelMovieTrailer?> fetchMovieTrailer(int id) async {
  final res = await _url('https://api.themoviedb.org/3/movie/$id/videos');
  if (res.statusCode == 200) {
    return fromJsonMovieTrailer(jsonDecode(res.body));
  }
  return null;
}

Future<Response> _url(String url) {
  return http.get(Uri.parse('$url?api_key=${getAPI()}'));
}
