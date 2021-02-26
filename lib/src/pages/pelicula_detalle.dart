import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula),
        ],
      )
    );
  }

  Widget _crearAppbar(Pelicula pelicula){
    
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      // nos dice cuan alto será
      expandedHeight: 200.0,
      floating: false,
      //indiqua que se mantenga visible cuando se empiza a hacer el scrool
      pinned: true,
      //recibe un widged que se va a tener que adaptar en el SliverAppBar 
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title:  Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgorundImg()),
          placeholder: AssetImage("assets/img/loading.gif"),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}