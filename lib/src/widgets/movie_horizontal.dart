import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView(
        //con el pageSnapping hacemos que el card no regrese a su posicion si no pasa el swap minimo que le da sensación de magneto
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage("assets/img/no-image.jpg"),
                fit: BoxFit.cover,
                height: 152.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              pelicula.title,
              //hace que parte del texto se ponga en ... cuando este excede de su contenido
              //overflow: TextOverflow.ellipsis,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }).toList();
  }
}
