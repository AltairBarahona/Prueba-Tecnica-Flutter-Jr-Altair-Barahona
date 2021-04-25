import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_tecnica_flutter_jr/src/globalWidgets/fondo_app.dart';
import 'package:prueba_tecnica_flutter_jr/src/globalWidgets/titulos.dart';
import 'package:prueba_tecnica_flutter_jr/src/models/persona_model.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Persona persona = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Stack(
      children: [
        FondoAppWidget(
          grades: pi / 5,
          positionTop: -65.0,
          positionLeft: 1.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitulosWigdet(),
            _containerRedondeado(persona, context),
          ],
        ),
      ],
    ));
  }

  Widget _containerRedondeado(Persona persona, context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 280,
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
                          Text(persona.email,
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 18)),
                          SizedBox(height: 10),
                          Text("Ciudad",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Text(persona.ciudad,
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 18)),
                          SizedBox(height: 10),
                          Text("Nombre de Compañía",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Text(persona.nombreDeCompania,
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 18)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
