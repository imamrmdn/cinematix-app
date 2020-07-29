part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  //method signUp atau registrasi
  static Future<SignInSignUpResult> signUp(
      String email,
      String password,
      String name,
      List<String> selectedGenres,
      String selectedLanguage,
      int balance) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //convert firebase user menjadi user
      User user = result.user.convertToUser(
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
        balance: balance,
      );

      //save to firestore
      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: '$e'.split(',')[1]);
    }
  }

  //method signIn atau Login
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = await result.user.fromFirestore();

      return SignInSignUpResult(user: user);
    } catch (_) {
      return SignInSignUpResult(
        message:
            'Email atau Password yang anda masukan salah !\nSilakan masukan dengan benar.',
      );
      //'$e'.split(',')[1].trim()
    }
  }

  //method Sign Out atau Logout
  static Future<void> signOut() async {
    try {
      await _auth.signOut();
      return SignOutResult(message: 'Anda telah Logout dari Cinematix App');
    } catch (_) {}
  }

  //cek status perubahan authentikasi
  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult {
  User user;
  String message;

  SignInSignUpResult({this.user, this.message});
}

class SignOutResult {
  String message;

  SignOutResult({this.message});
}
