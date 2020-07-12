part of 'widgets.dart';

class OnBoardingScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        minimum: EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/logo_cinematix.png'),
              ),
              Container(
                margin: EdgeInsets.only(top: 43.0, bottom: 16.0),
                child: Text('Cinematix App',
                    style: blackTextFont.copyWith(fontSize: 20.0)),
              ),
              Text(
                'Memesan tiket bioskop &\n menonton film baru jadi lebih mudah\n dari pada sebelumnya.',
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 75.0, bottom: 20.0),
                height: 65,
              ),
              Row(
                children: <Widget>[Text('')],
              )
            ],
          ),
        ),
      ),
    );
  }
}
