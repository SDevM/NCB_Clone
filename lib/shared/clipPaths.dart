import 'package:flutter/material.dart';
import 'package:untitled/shared/utils.miscellaneous.dart';

class LoginClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(60, 0);
    path.lineTo(90, 30);
    path.lineTo(size.width - 10, 30);
    path.arcToPoint(Offset(size.width, 40), radius: const Radius.circular(10));
    path.lineTo(size.width, size.height - 10);
    path.arcToPoint(Offset(size.width - 10, size.height),
        radius: const Radius.circular(10));
    path.lineTo(10, size.height);
    path.arcToPoint(Offset(0, size.height - 10),
        radius: const Radius.circular(10));
    path.lineTo(0, 40);
    path.arcToPoint(const Offset(10, 30), radius: const Radius.circular(10));
    path.lineTo(30, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      this != oldClipper;
}

class BottomBump extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - 125);
    path.arcToPoint(Offset(size.width, size.height - 125), radius: Radius.elliptical(size.width, 500));
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}

class TopBump extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 230);
    path.cubicTo(size.width - 30, 300, 30, 300, 0, 230);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}

class TopBumpR extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height * 0.3);
    path.cubicTo(size.width * 0.9, size.height * 0.65, size.width * 0.1, size.height * 0.65, 0, size.height * 0.3);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}

class TopBumpI extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return invertPath(TopBump().getClip(size), size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
