import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_flutter_jr/src/globalWidgets/fondo_app.dart';
import 'package:prueba_tecnica_flutter_jr/src/globalWidgets/titulos.dart';
import 'package:prueba_tecnica_flutter_jr/src/models/persona_model.dart';
import 'package:prueba_tecnica_flutter_jr/src/providers/personas_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FondoAppWidget(
              grades: -pi / 5, positionTop: -65.0, positionLeft: -250.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitulosWigdet(),
              Container(
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
      (persona) {
        final tempContainer = _crearOpcionRedondeada(persona, context);
        personas.add(tempContainer);
      },
    );
    return personas;
  }

  Widget _crearOpcionRedondeada(Persona persona, context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
      child: GestureDetector(
        onTap: () {
          print("presionado: " + persona.personaId.toString());
          Navigator.pushNamed(
            context,
            "detalle",
            arguments: persona,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
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
                        padding: const EdgeInsets.only(
                            top: 20, left: 40, bottom: 10),
                        child: Text(persona.nombre,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25,
                          child: Text("${persona.personaId}",
                              style: TextStyle(fontSize: 30)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
