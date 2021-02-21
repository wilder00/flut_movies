import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  //llamando el modelo de datos
  final peliculasProvider = new PeliculasProvider();

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  //recurso del cual se sacará : https://pub.dev/packages/flutter_swiper
  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      //initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        //evitamos construir si el snapshot no tiene data
        if (snapshot.hasData) {
          return CardSwiper(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );

    /* peliculasProvider.getEnCines();

    return CardSwiper(
      peliculas: [1, 2, 3, 4, 5],
    ); */
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Populares',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(height: 5.0),
          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          //textTheme.headline6 es como un título
          //Text('Populares', style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }
}
