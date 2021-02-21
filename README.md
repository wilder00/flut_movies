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
## Eztensiones de VSCode

### Paste Json as code
(https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype)[https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype]


---

### consejos recibido

> "Usa un archivo de configuraciones
> Sea un .env y usar dotenv en Flutter
> O un archivo settings.dart"