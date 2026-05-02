import 'package:flutter_dotenv/flutter_dotenv.dart';

String getAPI() {
  return dotenv.env['TMDB_API_KEY']!;
}
