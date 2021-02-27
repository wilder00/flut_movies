import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar como los iconos con acciones para limpiar o cancelar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          //query es una variable interna del searchDelegate, todo lo que se escribe se guarda ahí, así que lo cambianos a string vacio
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Es el icono que aparece a la izquierda
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        //progress un valor de 0 a 1
        progress: transitionAnimation,
      ),
      onPressed: () {
        //método interno del search delegate
        //el close: recibe de parámetro el contexto y el resultado que se quiere devolver
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar de la busqueda
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparece cuando escribimos
    return Container();
  }
}
