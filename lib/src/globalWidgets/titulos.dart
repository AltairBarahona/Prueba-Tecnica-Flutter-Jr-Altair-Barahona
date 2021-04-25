import 'dart:ui';

import 'package:flutter/material.dart';

class TitulosWigdet extends StatelessWidget {
  const TitulosWigdet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleTitulo = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    final styleSubTitulo = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    );
    return SafeArea(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prueba Técnica Flutter Jr\nAltair Barahona",
              style: styleTitulo,
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 18, left: 22),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.6),
                  ),
                  child: Text(
                    "Consumir API de jsonplaceholder.\nMostrar:\nNombre, Email, Ciudad,\nNombre de compañía\n",
                    style: styleSubTitulo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
