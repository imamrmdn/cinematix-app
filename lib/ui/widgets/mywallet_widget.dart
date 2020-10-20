part of 'widgets.dart';

class MyWallet extends StatelessWidget {
  final String balance;

  MyWallet({this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 95.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {},
          splashColor: accentColor2,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            width: SizeConfig.defaultWidth,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                leftItem(),
                rightItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget leftItem() {
    return Row(
      children: <Widget>[
        //Image.asset('assets/top_up.png'),
        SizedBox(width: 10),
        Text('My Wallet', style: blueTextFont)
      ],
    );
  }

  Widget rightItem() {
    return Row(
      children: <Widget>[
        Text(balance, style: blueNumberFont.copyWith(fontSize: 16.0)),
        SizedBox(width: 10),
        Image.asset('assets/wallet.png'),
      ],
    );
  }
}
