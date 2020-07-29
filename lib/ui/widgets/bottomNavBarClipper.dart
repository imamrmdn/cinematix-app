part of 'widgets.dart';

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 30, 0);
    path.quadraticBezierTo(size.width / 2 - 30, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 30, 33, size.width / 2 + 30, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
