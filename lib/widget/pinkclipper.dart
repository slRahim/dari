import 'package:flutter/material.dart';

class PinkClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    var path = new Path();
    path.lineTo(0, size.height / 3);
    var firstControlPoint = new Offset(size.width / 6, size.height / 3);
    var firstEndPoint = new Offset(size.width / 2.85, size.height / 4);
    var secondControlPoint = new Offset(size.width / 2 + 40, size.height / 6);
    var secondEndPoint =
    new Offset(size.width - (size.width / 4), size.height / 3.5);

    var thirdControlPoint = new Offset(size.width - 20, size.height / 6);
    var thirdEndPoint = new Offset(size.width, size.height / 4);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}