import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_tecnica_flutter_jr/src/pages/attempt_page.dart';
import 'package:prueba_tecnica_flutter_jr/src/pages/details_page.dart';
import 'package:prueba_tecnica_flutter_jr/src/pages/home_page.dart';
import 'package:prueba_tecnica_flutter_jr/src/pages/test_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba técnica Flutter junior',
      initialRoute: "home",
      routes: {
        "pruebaJson": (context) => AttemptPage(), //prueba de carga de json
        "testImpresion": (context) =>
            TestPage(), //prueba de impresión de nombres
        "home": (context) => HomePage(), //pantalla final con lista personas
        "detalle": (context) => DetailsPage(), //detalle de cada persona
      },
    );
  }
}
