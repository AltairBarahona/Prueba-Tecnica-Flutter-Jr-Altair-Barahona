import 'package:flutter/material.dart';

class FondoAppWidget extends StatelessWidget {
  final grades;
  final positionTop;
  final positionLeft;
  const FondoAppWidget({
    Key key,
    @required this.grades,
    @required this.positionTop,
    @required this.positionLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      angle: grades,
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

    return Hero(
      tag: 1,
      child: Stack(
        children: [
          gradiente,
          Positioned(
            top: positionTop,
            left: positionLeft,
            child: cajaRosa,
          ),
        ],
      ),
    );
  }
}
