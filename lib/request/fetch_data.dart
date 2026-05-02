import 'dart:convert';
import 'package:flutte_movie_api/function/function.dart';
import 'package:flutte_movie_api/model_data/model_movie.dart';
import 'package:flutte_movie_api/models/from_json.dart';
import 'package:http/http.dart' as http;

Future<ModelMovie?> fetch_movie() async {
  final res = await http.get(
    Uri.https(
      'https://api.themoviedb.org/3/movie/popular?api_key=${getAPI()}&page=1',
    ),
  );
  if (res.statusCode == 200) {
    return fromJsonMovie(jsonDecode(res.body) as Map<String, dynamic>);
  }
  return null;
}
