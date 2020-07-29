part of 'widgets.dart';

class OnBoardingScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        minimum: EdgeInsets.only(left: 55, right: 55),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/OnBoardingScreen2.png'),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 43.0, bottom: 16.0),
                child: Text(' ', style: blackTextFont.copyWith(fontSize: 20.0)),
              ),
              Container(
                child: Text(
                  'Ayo gunakan Cinematix App mau nonton\ndengan teman & keluarga juga bisa loh...',
                  style: greyTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 75.0, bottom: 20.0),
                width:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizeConfig.defaultWidth / 1.4
                        : SizeConfig.defaultWidth / 2.4,
                height:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizeConfig.defaultWidth / 8
                        : 80, //65
                child: Material(
                  color: mainColor,
                  borderRadius: borderRadius8,
                  child: InkWell(
                    onTap: () {},
                    splashColor: accentColor2,
                    borderRadius: borderRadius8,
                    child: Center(
                      child: Text(
                        'GET STARTED',
                        style: whiteTextFont3.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sudah Punya Akun ?',
                    style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                      onTap: () {
                        context.bloc<ScreenBloc>().add(GoToSignInScreen());
                      },
                      child: Text(' Sign In disini.', style: blueTextFont))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
