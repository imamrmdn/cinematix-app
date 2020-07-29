part of 'screens.dart';

class MovieScreen extends StatelessWidget {
  String format(int number) {
    var numberformat =
        NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp. ')
            .format(number);
    return numberformat;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, userState) => Stack(
        children: <Widget>[
          //body listview
          Container(
            padding: EdgeInsets.only(
                top: 170.0, bottom: 100.0, left: 30.0, right: 30.0),
            width: SizeConfig.defaultWidth,
            height: SizeConfig.defaultHeight,
            color: Color(0xFFEDEDED),
          ),
          //header
          Container(
            width: SizeConfig.defaultWidth,
            height: 130.0,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
          ),
          TopUpWidget(
              balance: (userState is UserLoaded)
                  ? format(userState.user.balance)
                  : 'Loading ...')
        ],
      ),
    );
  }
}
