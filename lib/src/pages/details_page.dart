import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_flutter_jr/src/models/persona_model.dart';
import 'package:prueba_tecnica_flutter_jr/src/providers/personas_provider.dart';

class DetailsPage extends StatelessWidget {
  final styleTitulo = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final styleSubTitulo = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _titulos(),
              Container(
                //height: MediaQuery.of(context).size.height * 0.7,
                child: Expanded(
                  child: ListView(
                    children: [
                      _opcionesPersonas(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0, 0.6),
          end: FractionalOffset(0.0, 1),
          colors: [
            Color.fromRGBO(52, 54, 101, 1),
            Color.fromRGBO(35, 37, 57, 1),
          ],
        ),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 650,
        height: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            // color: Colors.pink,
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 90, 188, 1),
              Color.fromRGBO(255, 160, 172, 1),
            ])),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          top: -65,
          left: -250,
          child: cajaRosa,
        ),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prueba Técnica Flutter Jr\nAltair Barahona",
              style: styleTitulo,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 18, left: 22),
              child: Text(
                "Consumir API de jsonplaceholder.\nMostrar:\nNombre, Email, Ciudad,\nNombre de compañía",
                style: styleSubTitulo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _opcionesPersonas() {
    return FutureBuilder(
      future: personaProvider.getPersonas(),
      builder: (context, AsyncSnapshot<List<Persona>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<Persona> data, BuildContext context) {
    final List<Widget> personas = [];
    if (data == null) {
      return [];
    }

    data.forEach(
      (element) {
        final tempContainer = _crearBotonRedondeado(
            Colors.red,
            element.personaId,
            element.nombre,
            element.email,
            element.ciudad,
            element.nombreDeCompania);
        personas.add(tempContainer);
      },
    );
    return personas;
  }

  Widget _crearBotonRedondeado(Color color, int id, String nombre, String email,
      String ciudad, String nombreCompania) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 260,
            width: double.infinity,
            // margin: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, bottom: 10),
                      child: Text(nombre,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 25,
                        child: Text("$id", style: TextStyle(fontSize: 30)),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Text(email,
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 18)),
                          SizedBox(height: 10),
                          Text("Ciudad",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Text(ciudad,
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 18)),
                          SizedBox(height: 10),
                          Text("Nombre de Compañía",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Text(nombreCompania,
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            /*Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 1),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 30,
                  child: Text("$id", style: TextStyle(fontSize: 30)),
                ),
                Text(
                  nombre,
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),*/
          ),
        ),
      ),
    );
  }
}
