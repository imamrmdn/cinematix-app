part of 'shareds.dart';

//imagepicker to use registration or signup screen and edit profile screen
Future<File> getImage() async {
  // ignore: deprecated_member_use
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  return image;
}

//
Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);
  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}

//format number
String formatNumber(int number) {
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

//cek genre pilihan
handleGenre(String genre) {
  String music = 'assets/music_genre.png';
  String horror = 'assets/horor_genre.png';
  String crime = 'assets/crime_genre.png';
  String drama = 'assets/drame_genre.png';
  String action = 'assets/action_genre.png';
  String scifi = 'assets/scifi_genre.png';

  if (genre == 'Music') {
    return music;
  } else if (genre == 'Horror') {
    return horror;
  } else if (genre == 'Drama') {
    return drama;
  } else if (genre == 'Action') {
    return action;
  } else if (genre == 'Sci-Fi') {
    return scifi;
  } else {
    return crime;
  }
}
