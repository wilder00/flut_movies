import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
  //obligamos que cuando se construya el CardSwiper tengan que ingresar el valor para peliculas
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    //usando media query
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      //con souble.infinity le decimos que use todo el ancho
      //width: double.infinity,

      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          peliculas[index].uniqueId = "${peliculas[index].id}-tarjeta";
          return Hero(
            tag: peliculas[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "detalle",
                    arguments: peliculas[index]),
                child: FadeInImage(
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  placeholder: AssetImage("assets/img/no-image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        //le decimos cuantos elementos tendrá el carousel
        itemCount: peliculas.length,
        //quitamos paginations para quitar los puntos del carousel
        //pagination: new SwiperPagination(),
        //quitamos el control para que no se muestre las flechas
        /* control: new SwiperControl(), */
      ),
    );
  }
}
