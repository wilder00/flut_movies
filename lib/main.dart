import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future<void> main() async {
  //esto es por default
  //await DotEnv.load(fileName: ".env");
  await DotEnv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        "/": (BuildContext contex) => HomePage(),
        "detalle": (BuildContext context) => PeliculaDetalle(),
      },
    );
  }
}
