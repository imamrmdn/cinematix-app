part of 'screens.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignIn = false;
  bool _showPassword = false;

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor3)));
    //for back to onBoardingScreen
    return WillPopScope(
      onWillPop: () {
        context.bloc<ScreenBloc>().add(GoToOnBoardingScreen());
        return;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          minimum: EdgeInsets.only(left: 24, right: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/logo_cinematix.png'),
                  ),
                  SizedBox(height: 50),
                  TextInputForm(
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    labelText: 'Email',
                    hintText: 'Masukan Email Anda',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextInputForm(
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 6;
                      });
                    },
                    controller: _passwordController,
                    textInputType: TextInputType.text,
                    obscureText: !_showPassword,
                    labelText: 'Password',
                    hintText: 'Password anda',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        Text('Lupas Password?',
                            style: greyTextFont.copyWith(fontSize: 14)),
                        Text(' Klik Disini.',
                            style: blueTextFont.copyWith(fontSize: 14))
                      ],
                    ),
                  ),
                  isSignIn
                      ? Loading(width: 100, height: 100)
                      : ButtonNext(
                          elavation: isEmailValid && isPasswordValid ? 8 : 0,
                          marginButtonNext:
                              EdgeInsets.only(top: 40, bottom: 30),
                          backgroundColor: isEmailValid && isPasswordValid
                              ? mainColor
                              : greyColor,
                          onPressed: isEmailValid && isPasswordValid
                              ? () async {
                                  setState(() {
                                    isSignIn = true;
                                  });
                                  SignInSignUpResult result =
                                      await AuthServices.signIn(
                                          _emailController.text,
                                          _passwordController.text);

                                  if (result.user == null) {
                                    setState(() {
                                      isSignIn = false;
                                    });
                                    Flushbar(
                                      duration: Duration(seconds: 4),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: accentColor2,
                                      message: result.message,
                                      leftBarIndicatorColor: mainColor,
                                    )..show(context);
                                  }
                                }
                              : null,
                        ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Belum punya akun? ',
                        style: greyTextFont.copyWith(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .bloc<ScreenBloc>()
                              .add(GoToRegistrationScreen(Registration()));
                        },
                        child: Text(
                          'Sign Up.',
                          style: blueTextFont.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
