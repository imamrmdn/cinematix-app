part of 'screens.dart';

class AccountConfirmScreen extends StatefulWidget {
  final Registration registration;

  AccountConfirmScreen(this.registration);

  @override
  _AccountConfirmScreenState createState() => _AccountConfirmScreenState();
}

class _AccountConfirmScreenState extends State<AccountConfirmScreen> {
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<ScreenBloc>()
            .add(GoToPreferenceScreen(widget.registration));
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
                text1: 'Konfirmasi Akun mu',
                text2: '',
                onTap: () {
                  context
                      .bloc<ScreenBloc>()
                      .add(GoToPreferenceScreen(widget.registration));
                },
              ),
              //
              SizedBox(height: SizeConfig.defaultHeight / 6),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 50.0),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: mainColor),
                        boxShadow: [
                          BoxShadow(
                            color: mainColor.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: (widget.registration.profilePicture == null)
                              ? AssetImage('assets/user_picture.png')
                              : FileImage(widget.registration.profilePicture),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Welcome to Cinematix',
                      style:
                          blackTextFont.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('${widget.registration.email}', style: blackTextFont),
                    SizedBox(height: 10),
                    (isSignUp)
                        ? Loading()
                        : SizedBox(
                            height: 50,
                            width: 250,
                            child: RaisedButton(
                              color: mainColor,
                              splashColor: accentColor2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: borderRadius8),
                              child:
                                  Text('Konfirm Akunmu', style: whiteTextFont),
                              onPressed: () async {
                                setState(() {
                                  isSignUp = true;
                                });
                                //
                                imageFileUpload =
                                    widget.registration.profilePicture;
                                //
                                SignInSignUpResult result =
                                    await AuthServices.signUp(
                                  widget.registration.email,
                                  widget.registration.password,
                                  widget.registration.name,
                                  widget.registration.selectedGenres,
                                  widget.registration.selectedLanguage,
                                );

                                //
                                if (result.user == null) {
                                  setState(() {
                                    isSignUp = false;
                                  });
                                  Flushbar(
                                    duration: Duration(seconds: 2),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    icon: Icon(Icons.info_outline,
                                        color: whiteColor),
                                    backgroundColor: Colors.red,
                                    messageText: Text(result.message,
                                        style: whiteTextFont),
                                  )..show(context);
                                }
                              },
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
