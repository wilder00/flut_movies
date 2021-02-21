import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> peliculas;
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
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        //quitamos el control para que no se muestre las flechas
        /* control: new SwiperControl(), */
      ),
    );
  }
}
