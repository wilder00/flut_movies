// sin el as podríamos llamar a las funciones como get(), pero con ella hariamos http.get()
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = "c6f33890e576ca843a27cb29e254686b";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    //queremos almacenar en resp la respuesta del servidor y no un future, por ello esperamos a que se resuelva el future
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    //URL:https(<url>, <Path>, {<variables>})
    final url = Uri.https(_url, "3/movie/now_playing", {
      'api_key': _apiKey,
      'language': _language,
    });

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    //URL:https(<url>, <Path>, {<variables>})
    final url = Uri.https(_url, "3/movie/popular", {
      'api_key': _apiKey,
      'language': _language,
    });

    return await _procesarRespuesta(url);
  }
}
