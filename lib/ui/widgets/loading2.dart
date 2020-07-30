part of 'widgets.dart';

class Loading2 extends StatelessWidget {
  final double height;
  final double width;

  Loading2({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: SpinKitHourGlass(
        color: accentColor2,
      ),
    );
  }
}
