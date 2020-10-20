part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;
  final String createAt = DateFormat('dd-MM-yyyy HH:mm')
      .format(DateTime.now().add(Duration(days: 1)));

  User(
    this.id,
    this.email, {
    this.name,
    this.profilePicture,
    this.selectedGenres,
    this.selectedLanguage,
    this.balance = 50000,
  });

  User copyWith({String name, String profilePicture, int balance}) {
    return User(
      this.id,
      this.email,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      selectedGenres: selectedGenres,
      selectedLanguage: selectedLanguage,
      balance: balance ?? this.balance,
    );
  }

  @override
  String toString() {
    return '[$id] - $name, $email ';
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedLanguage,
        selectedGenres,
        balance,
        createAt,
      ];
}
