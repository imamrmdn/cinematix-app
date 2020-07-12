part of 'widgets.dart';

class ButtonNext extends StatelessWidget {
  final EdgeInsetsGeometry marginButtonNext;
  final Function onPressed;
  final Color backgroundColor;
  final double elavation;

  ButtonNext({
    this.marginButtonNext,
    this.onPressed,
    this.backgroundColor,
    this.elavation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: marginButtonNext,
      child: FloatingActionButton(
        elevation: elavation,
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
