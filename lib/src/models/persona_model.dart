class Personas {
  List<Persona> itemsPersonas = [];

  Personas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    }

    jsonList.forEach((persona) {
      final personaTemp = Persona.fromJsonMap(persona);
      itemsPersonas.add(personaTemp);
    });
  }
}

class Persona {
  int personaId;
  String nombre;
  String email;
  String ciudad;
  String nombreDeCompania;

  Persona({
    this.personaId,
    this.nombre,
    this.email,
    this.ciudad,
    this.nombreDeCompania,
  });

  Persona.fromJsonMap(Map<String, dynamic> json) {
    personaId = json["id"];
    nombre = json["name"];
    email = json["email"];
    var addressTemp = json["address"];
    ciudad = addressTemp["city"];
    var companiaTemp = json["company"];
    nombreDeCompania = companiaTemp["name"];
  }
}
