import 'package:flutter/material.dart';
import 'package:prueba_tecnica_flutter_jr/src/models/persona_model.dart';
import 'package:prueba_tecnica_flutter_jr/src/providers/personas_provider.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    //app bar
    return Scaffold(
      //construye la pantalla
      appBar: AppBar(
        title: Text("Prueba técnica Flutter Junior Dev"),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              Navigator.pushNamed(context, "detalleFinal");
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: personaProvider.getPersonas(),
        builder: (context, AsyncSnapshot<List<Persona>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        },
      ),
    );
  }

  List<Widget> _listaItems(List<Persona> data, context) {
    final List<Widget> personas = [];
    if (data == null) {
      return [];
    }

    data.forEach(
      (elemento) {
        final tempListTile = ListTile(
          title: Text(
            elemento.nombre,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            elemento.email,
            style: TextStyle(fontSize: 20),
          ),
          leading: Text(elemento.ciudad),
          trailing: Text(
            elemento.nombreDeCompania,
            style: TextStyle(fontSize: 20),
          ),
        );
        personas.add(tempListTile);
      },
    );
    return personas;
  }
}
