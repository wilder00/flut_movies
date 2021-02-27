import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  //creando un controlador para el Widget PAgeView.
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    //agregando un escucha evento y dispare el callback cada vez que reacciones el listener (cuando se mueva el scroll)
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        //con el pageSnapping hacemos que el card no regrese a su posicion si no pasa el swap minimo que le da sensación de magneto
        pageSnapping: false,
        controller: _pageController,
        //es necesario que sepa cuántos items estan por renderizar
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int i) {
          return _tarjeta(context, peliculas[i]);
        },
        //children: _tarjetas(context),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueId = "${pelicula.id}-poster";

    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            //el tag será y debe ser un identificador único para el widget hero
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage("assets/img/no-image.jpg"),
                fit: BoxFit.cover,
                height: 152.0,
              ),
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

    return GestureDetector(
        child: tarjeta,
        onTap: () {
          //navigator permite incluir arguments
          Navigator.pushNamed(context, "detalle", arguments: pelicula);
        });
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
