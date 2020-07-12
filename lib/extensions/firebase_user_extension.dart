part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser({
    String name = 'no name',
    List<String> selectedGenres = const [],
    String selectedLanguage = 'English',
    int balance = 50000,
  }) {
    return User(
      this.uid,
      this.email,
      name: name,
      selectedGenres: selectedGenres,
      selectedLanguage: selectedLanguage,
      balance: balance,
    );
  }

  Future<User> fromFirestore() async {
    return await UserServices.getUser(this.uid);
  }
}
