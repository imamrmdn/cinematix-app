part of 'widgets.dart';

class Loading extends StatelessWidget {
  final double width;
  final double height;

  Loading({
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: SpinKitPulse(
        color: mainColor,
      ),
    );
  }
}
