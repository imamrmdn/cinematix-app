part of 'models.dart';

class Registration {
  String name;
  String email;
  String password;
  String createdAt;
  List<String> selectedGenres;
  String selectedLanguage;
  File profilePicture;

  Registration({
    this.name = '',
    this.email = '',
    this.password = '',
    this.createdAt = '',
    this.selectedGenres = const [],
    this.selectedLanguage = '',
    this.profilePicture,
  });
}
