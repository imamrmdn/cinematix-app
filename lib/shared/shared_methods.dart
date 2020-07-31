part of 'shareds.dart';

//imagepicker to use registration or signup screen and edit profile screen
Future<File> getImage() async {
  // ignore: deprecated_member_use
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  return image;
}

//format number
String format(int number) {
  var numberformat =
      NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp ')
          .format(number);
  return numberformat;
}

//format language form firestore
String formatLanguage(String lang) {
  var langFormat = lang.split('[')[1].split(']')[0];
  return langFormat;
}
