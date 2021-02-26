// Se importó el dart:async para usar el StreamControllet()
import 'dart:async';
import 'dart:convert';

// sin el as podríamos llamar a las funciones como get(), pero con ella hariamos http.get()
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = "c6f33890e576ca843a27cb29e254686b";
  String _url = "api.themoviedb.org";
  //String _language = "es-ES";
  String _language = "es-MX";

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();
  //creando corriente de datos
  //sin el .broadcast() solo sería escuchado por uno
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  // creando 2 getters, uno para insertar información al Stream y otro para poder escuchar todo lo que este Stream emita

  //indicamos que será una función que recibe una lista de peliculas. Nos servirá para introducir datoa
  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  //nos servirá para escuchar datos
  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStream() {
    _popularesStreamController?.close();
  }

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
    if (_cargando) return [];
    _cargando = false;
    //URL.https(<url>, <Path>, {<variables>})
    _popularesPage++;
    final url = Uri.https(_url, "3/movie/popular", {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString(),
    });

    final resp = await _procesarRespuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);

    return resp;
  }

  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, "3/movie/$peliId/credits",
        {"api_key": _apiKey, "language": _language});
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodeData['cast']);
  }
}
