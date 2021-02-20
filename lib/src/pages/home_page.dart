import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //El safe area ayuda a utilizar solo el área de la pantalla en la que no está el notch de algunos mobiles
      body: SafeArea(
        child: Text('Hola Mundo!!!!!!'),
      ),
    );
  }
}
