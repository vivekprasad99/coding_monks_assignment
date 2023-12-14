import 'package:flutter/widgets.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path_0 = Path();

    path_0.moveTo(size.width * 0.0050000, size.height * 0.6400000);
    path_0.quadraticBezierTo(size.width * 0.1993500, size.height * 0.7583571,
        size.width * 0.2049000, size.height * 0.8355857);
    path_0.quadraticBezierTo(size.width * 0.2061250, size.height * 0.8888571,
        size.width * 0.2073750, size.height * 1.0008714);
    path_0.lineTo(size.width * 0.7935500, size.height * 0.9987571);
    path_0.quadraticBezierTo(size.width * 0.7935750, size.height * 0.8984714,
        size.width * 0.7908500, size.height * 0.8398429);
    path_0.quadraticBezierTo(size.width * 0.7897250, size.height * 0.7493571,
        size.width * 1.0050000, size.height * 0.6442857);
    path_0.lineTo(size.width * 1.0050000, 0);
    path_0.lineTo(0, size.height * -0.0028571);

    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
