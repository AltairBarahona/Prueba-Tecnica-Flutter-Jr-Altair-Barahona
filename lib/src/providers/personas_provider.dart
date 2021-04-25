import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_tecnica_flutter_jr/src/models/persona_model.dart';

class PersonasProvider {
  String _url = "jsonplaceholder.typicode.com"; //fuente de datos
  List<Persona> listaPersonas = []; //lista para guardar todas las personas

  PersonasProvider() {
    getPersonas();
  }
  Future<List<Persona>> _procesarRespuestaUriParse(Uri url) async {
    final respuesta =
        //await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
        await http.get(url);

    final List decodedData = json.decode(respuesta.body);
    final personasACrear = Personas.fromJsonList(decodedData);

    return personasACrear.itemsPersonas;
  }

  Future<List<Persona>> getPersonas() async {
    final url = Uri.https(_url, "/users");
    final respuesta = await _procesarRespuestaUriParse(url);
    listaPersonas.addAll(respuesta);
    //print(listaPersonas);
    return respuesta;
  }
}

final personaProvider = PersonasProvider();
