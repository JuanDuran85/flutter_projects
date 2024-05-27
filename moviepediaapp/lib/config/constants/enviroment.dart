// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String tmdbApyKey = dotenv.env['TMDB_APY_KEY'] ?? 'No api key found';
}