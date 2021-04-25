import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AttemptPage extends StatefulWidget {
  @override
  AttemptPageState createState() => new AttemptPageState();
}

class AttemptPageState extends State<AttemptPage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {"Accept": "application/json"},
    );

    this.setState(() {
      data = json.decode(response.body);
    });

    //var dataTemp = data[1]["address"];
    //print(data[1]["name"]);
    //print("Ciudad: " + dataTemp["street"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(
              data[index]["name"],
              style: TextStyle(fontSize: 35),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "home");
        },
        child: Icon(Icons.arrow_back, size: 50),
      ),
    );
  }
}
