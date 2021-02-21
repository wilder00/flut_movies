# peliculas

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---
## Widgets

### ClipRRect
Lo utilizamos para crear bordes redondeados (se usa como un container)


### PageView
sirve para hacer scrool de coleccionables,  por ello tiene como parémtro children: <Widget>[]





---
## packetes

### flutter_Swiper

El paquete de swiper lo podemos obtener del sugiente [enlace](https://pub.dev/packages/flutter_swiper)

#### registrar dependencia
Agregar lo siguiente en pubspec.yaml:
```
dependencies:
  flutter_swiper: ^1.1.6
```

para instalarlo:
```
flutter pub get
```

Para importarlo
```
import 'package:flutter_swiper/flutter_swiper.dart';
```

### http
Se tiene que registrar en el yaml e importar. más info [aquí](https://pub.dev/packages/http#-installing-tab-)



### Stream
Como un rio estrecho, o un flujo de liquido,aire o gas. En el stream, la información solo fluye en un sentido, pero a esta se le puede conectar otra que tambien vaya en la misma dirección

Data Entar ==> | StreamController | ==> Data sale

* StreamController se encarga de procesar qué información entra y cuál sale
* Dentro del Stream, también hay un StreamTransformer que se encarga de transformar la información
* Para añadir información usaremos `Sink`
* Para escuchar la salida de la información usaremos `Stream`, el cual estará transmitiendo todo lo que el StreamControler le indique
* `Sink` y `Stram` son parte del StreamController


---

## PATRON BLOC

Es una forma para manejar estado de la data de nuestra aplicación.Pero no es el único, hay otras maneras de poder separar la construccion de los widgets del estado de la data de nuestra aplicación,  por ejemplo:

* ScopedModel
* Patron Redux
* Inherited Wiggets
* Provider
* y Otros ...

### ¿que es y porqué usarlo?

El proton bloc significa business logic component (lógica de negocio de componente) Este trata de tener centralizada la información de nuestra aplicación
por ejemplo, tener información de los usuarios, productos, peliculas, Formulario.

La idea del patron bloc es que nosotros podamos extraer lo que es la lógica del manejo de la información y centralizarla en ese bloc, el bloc se encargará de
comunicar entre widgets. 

Un block trabaja en base al Stream. Por ello se debe considerar 3 puntos importantes:

* Trabaja únicamente con entradas y salidas de información
* Para introducir información usaremos el sink y para la salida usaremos un stream 
* Debemos cerrar el stream cuando ya no lo estamos utilizando 

La idea principal de todo esto es que * Los widgets se encarguen únicamente de dibujarse y no de ocntrolar el estado de al información

#### StreamControles
hay dos tipos:
* SingleSubscription: solo el widget que está escuchando puede seguir escuchando exclusivamente hasta que cierre la conexión, si otros quieren escuchar, deberan esperar
* Broadcast : varios pueden escuchar

Por defecto un stream controller es de SingleSubcription 

un ejemplo:
```
class Mibloc{
  StreamController<String> _streamController = new StreamController<String>();

  //¿qué clase de información entrará al sink?
  Sink<String> get inputSink => streamController.sink;

  //¿Qué clase de información saldrá?
  Stream<String> get outputStream => streamController.stream;

  //transformado
  Stream<String> get outputStream => streamController.stream.transform( algoParaTransformar);
}
```

Cerrando un Stream
```
class MiBloc{
  //...
  //...
  //...
  //creamos el método que nos permitirá cerrar el stream, es una convensión pornerle dispose
  Void dispose(){
    _streamController?.close();
  }

}
```

Existe un Widget llamado StreamController que se encarga de dibujar un widget cada vez que se recibe información de un Stream
Ejemplo en flutter:

* un widgetA 
```
floatingActionButton(
  onPress: ()=> MyBloc().inputSink.add("Hola mundo")
)
```
* un WidgetB
```
StreamBuilder(
  stream: MyBloc.outputStream,
  builder: (BuildContext context, AsyncSnapshot snapshot){
    return Container();
  }
)
```
Segun se vé, se va a construir un container cada vez que se activa el onPress. Las propiedades del Builder son:

* context: Contiene la información del árbol de widgets y más ...
* Snapshot: información referente al estado del Stream y la información que sale del Stream

#### Lugar típico para llamar al dispose del Bloc
Es en el pso del ciclo de vida de un Stateful Widget dispose();

```
@override
void dispose(){
  super.dispose();

  miBloc.dispose();
}
```



---
## Eztensiones de VSCode

### Paste Json as code
(https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype)[https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype]


---

### consejos recibido

> "Usa un archivo de configuraciones
> Sea un .env y usar dotenv en Flutter
> O un archivo settings.dart"