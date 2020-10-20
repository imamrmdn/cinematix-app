part of 'screens.dart';

class SignUpScreen extends StatefulWidget {
  final Registration registration;

  SignUpScreen(this.registration);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registration.name;
    emailController.text = widget.registration.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToSignInScreen());
        return;
      },
      child: Scaffold(
        body: Container(
          color: whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            children: <Widget>[
              //
              BackButtonAndText(
                text1: 'Sign Up',
                text2: 'Masukan data dibawah ini untuk melakukan sign up.',
                onTap: () {
                  context.bloc<ScreenBloc>().add(GoToSignInScreen());
                },
              ),
              //
              AddProfilePicture(
                image1: (widget.registration.profilePicture == null)
                    ? AssetImage('assets/user_picture.png')
                    : FileImage(widget.registration.profilePicture),
                image2: AssetImage((widget.registration.profilePicture == null)
                    ? 'assets/btn_add_photo.png'
                    : 'assets/btn_add_photo-1.png'),
                onTap: () async {
                  if (widget.registration.profilePicture == null) {
                    widget.registration.profilePicture = await getImage();
                    Flushbar(
                      duration: Duration(seconds: 2),
                      icon: Icon(Icons.done_outline),
                      messageText: Text('Berhasil Menambah Profile Picture.',
                          style: blackTextFont),
                      backgroundColor: Colors.greenAccent,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: mainColor,
                    )..show(context);
                    if (widget.registration.profilePicture == null) {
                      Flushbar(
                        duration: Duration(seconds: 2),
                        titleText: Text(
                          'Anda belum menambahkan Profile Picture',
                          style: blackTextFont.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(Icons.info_outline, color: blackColor),
                        messageText: Text('silahkan pilih profile picture!',
                            style: blackTextFont),
                        backgroundColor: Colors.yellowAccent,
                        flushbarPosition: FlushbarPosition.TOP,
                        leftBarIndicatorColor: mainColor,
                      )..show(context);
                    }
                  } else {
                    widget.registration.profilePicture = null;
                    Flushbar(
                      duration: Duration(seconds: 1),
                      messageText: Text('Poto Profile Berhasil Dihapus!',
                          style: whiteTextFont),
                      backgroundColor: Colors.red,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: mainColor,
                    )..show(context);
                  }
                  setState(() {});
                },
              ),
              SizedBox(height: 30.0),
              //
              TextInputForm(
                controller: nameController,
                textInputType: TextInputType.text,
                obscureText: false,
                labelText: 'Username',
                hintText: 'Masukan nama panggilan anda',
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20.0),
              TextInputForm(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                labelText: 'Email',
                hintText: 'Masukan email aktif anda',
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 20.0),
              TextInputForm(
                controller: passwordController,
                textInputType: TextInputType.text,
                obscureText: !_showPassword,
                labelText: 'Password',
                hintText: 'Masukan password anda',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    )),
              ),
              SizedBox(height: 20.0),
              TextInputForm(
                controller: confirmPasswordController,
                textInputType: TextInputType.text,
                obscureText: !_showConfirmPassword,
                labelText: 'Confirm Password',
                hintText: 'Masukan ulang password anda',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showConfirmPassword = !_showConfirmPassword;
                    });
                  },
                  child: Icon(
                    _showConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              ButtonNext(
                backgroundColor: mainColor,
                onPressed: () {
                  if (!(nameController.text.trim() != '' &&
                      emailController.text.trim() != '' &&
                      passwordController.text.trim() != '' &&
                      confirmPasswordController.text.trim() != '')) {
                    Flushbar(
                      duration: Duration(seconds: 2),
                      messageText: Text('Silahkan isi semua field.',
                          style: whiteTextFont),
                      backgroundColor: Colors.red,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: mainColor,
                    )..show(context);
                  } else if (!EmailValidator.validate(emailController.text)) {
                    Flushbar(
                      duration: Duration(seconds: 1),
                      messageText: Text('Format email salah anda salah!',
                          style: whiteTextFont),
                      backgroundColor: Colors.red,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: mainColor,
                    )..show(context);
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    Flushbar(
                      duration: Duration(seconds: 1),
                      messageText: Text(
                          'Confirm Password tidak sama dengan Password anda.',
                          style: whiteTextFont),
                      backgroundColor: Colors.red,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: mainColor,
                    )..show(context);
                  } else if (passwordController.text.length < 6) {
                    Flushbar(
                      duration: Duration(seconds: 1),
                      messageText: Text(
                          'Password minimal 6 karakter atau lebih.',
                          style: whiteTextFont),
                      backgroundColor: Colors.red,
                      flushbarPosition: FlushbarPosition.TOP,
                      leftBarIndicatorColor: mainColor,
                    )..show(context);
                  } else {
                    widget.registration.name = nameController.text;
                    widget.registration.email = emailController.text;
                    widget.registration.password = passwordController.text;

                    //
                    context
                        .bloc<ScreenBloc>()
                        .add(GoToPreferenceScreen(widget.registration));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
