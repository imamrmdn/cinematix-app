part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final String text;
  final Function onTap;
  final TextStyle textStyle;

  SelectableBox(
    this.text, {
    this.isSelected = false,
    this.isEnabled = true,
    this.width = 144.0,
    this.height = 60.0,
    this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius8,
          color: (!isEnabled)
              ? greyColor
              : isSelected ? accentColor2 : Colors.transparent,
          border: Border.all(
            color: (isEnabled)
                ? greyColor
                : isSelected ? Colors.transparent : greyColor,
          ),
        ),
        child: Center(
            child: Text(
          text ?? 'none',
          style: (textStyle ?? blackTextFont),
        )),
      ),
    );
  }
}
