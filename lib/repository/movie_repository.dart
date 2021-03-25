import 'package:providermovie/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieRepository {
  var queryPram = {'api_key': '14c0fcc2177720bb7965296dc6ea68ad'};

  Future<List<Movie>> loadMovies() async {
    var uri =
        Uri.https("api.themoviedb.org", "/3/movie/popular", queryPram);

    var reponse = await http.get(uri);

    if (reponse.body != null) {
      Map<String, dynamic> body = json.decode(reponse.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      }
    }
  }
}
