part of 'services.dart';

class UserServices {
  //nama collection/table di firestore
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  //signUp user
  static Future<void> updateUser(User user) async {
    //sbelum save ke firestore ubah selectedgenre ke string
    // String genres = '';
    // for (var genre in user.selectedGenres) {
    //   genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    // }

    //save ke firestore
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      //kalau tidak null save kalau null = string kosong
      'profilePicture': user.profilePicture ?? '',
      'createdAt': user.createAt,
    });
  }

  //get user login/sign in
  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return User(
      id,
      snapshot.data['email'],
      name: snapshot.data['name'],
      profilePicture: snapshot.data['profilePicture'],
      selectedGenres: (snapshot.data['selectedGenres'] as List)
          .map((e) => e.toString())
          .toList(),
      selectedLanguage: snapshot.data['selectedLanguage'],
    );
  }
}
