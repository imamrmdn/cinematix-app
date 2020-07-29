part of 'widgets.dart';

class TopUpWidget extends StatelessWidget {
  final String balance;

  TopUpWidget({this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35.0, right: 35.0, top: 95.0),
      child: Card(
        elevation: 2,
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
        Image.asset('assets/top_up.png'),
        SizedBox(width: 10),
        Text('Top Up', style: blueTextFont)
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
