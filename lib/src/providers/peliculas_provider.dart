import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula.dart';

class PeliculasProvider {
  String _apikey = '9db0e71aa0e71827541eed1227ee212f';
  String _url = 'https://api.themoviedb.org';
  String _language = 'es-Es';

  List<Pelicula> peliculaFromJson(String str) =>
      List<Pelicula>.from(json.decode(str).map((x) => Pelicula.fromJson(x)));

  String peliculaToJson(List<Pelicula> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Future<List<Pelicula>> getNowPlaying() async {
    var decodedData = await procesarResponse('now_playing');

    return decodedData;
  }

  Future<List<Pelicula>> getPopulares() async {
    var decodedData = await procesarResponse("popular");

    return decodedData;
  }

  Future<List<Pelicula>> procesarResponse(String api) async {
    _url = '$_url/3/movie/$api?api_key=$_apikey&language=$_language';

    var response = await http.get(_url);
    var body = json.decode(response.body);
    var results = json.encode(body['results']);
    var decodedData = peliculaFromJson(results);
    return decodedData;
  }
}
