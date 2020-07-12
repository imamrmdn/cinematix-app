part of 'shareds.dart';

class SizeConfig {
  static MediaQueryData mediaQueryData;
  static double defaultMargin;
  static double defaultWidth;
  static double defaultHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    defaultMargin = mediaQueryData.size.width / 20;
    defaultWidth = mediaQueryData.size.width;
    defaultHeight = mediaQueryData.size.height;
  }
}
