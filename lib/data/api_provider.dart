import 'dart:convert';

import 'package:demo_app/model/popular_movies.dart';
import 'package:http/http.dart' show Client, Response;

class ApiProvider {
  String apiKey = '689d987f6a2f4bee300e4494c7d9860c';
  String baseurl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response = await client.get('$baseurl/movie/popular?api_key=$apiKey');

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}