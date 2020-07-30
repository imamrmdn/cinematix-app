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
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: Colors.yellow)));
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
              SignUpTextAndButton(onTap: () {
                context.bloc<ScreenBloc>().add(GoToSignInScreen());
              }),
              //
              AddProfilePicture(
                image1: (widget.registration.profilePicture == null)
                    ? AssetImage('assets/user_picture.png')
                    : FileImage(widget.registration.profilePicture),
                image2: AssetImage((widget.registration.profilePicture == null)
                    ? 'assets/btn_add_photo.png'
                    : 'assets/btn_Add_photo-1.png'),
                onTap: () {},
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
                obscureText: !_showPassword,
                labelText: 'Confirm Password',
                hintText: 'Masukan ulang password anda',
                prefixIcon: Icon(Icons.lock),
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
              SizedBox(height: 30.0),
              FloatingActionButton(
                backgroundColor: mainColor,
                child: Icon(Icons.arrow_forward),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
