import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Peliculas en cines"),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      //El safe area ayuda a utilizar solo el área de la pantalla en la que no está el notch de algunos mobiles
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas(),
          ],
        ),
      ),
    );
  }

  //recurso del cual se sacará : https://pub.dev/packages/flutter_swiper
  Widget _swiperTarjetas() {
    //llamando el modelo de datos
    PeliculasProvider peliculasProvider = new PeliculasProvider();
    peliculasProvider.getEnCines();

    return CardSwiper(
      peliculas: [1, 2, 3, 4, 5],
    );
  }
}
