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
            width: SizeConfig.defaultWidth,
            height: SizeConfig.defaultHeight,
            color: Color(0xFFEDEDED),
          ),
          //header
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 40.0, right: 40.0),
            width: SizeConfig.defaultWidth,
            height: 130.0,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: (userState is UserLoaded)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //profile picture
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 65.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: whiteColor, width: 1),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Loading(height: 65.0, width: 65.0),
                            Container(
                              width: 65.0,
                              height: 65.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (userState.user.profilePicture ==
                                              '')
                                          ? AssetImage(
                                              'assets/user_picture.png')
                                          : NetworkImage(
                                              userState.user.profilePicture),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      //
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8.0),
                          SizedBox(
                            width: SizeConfig.defaultWidth - 2 * 40.0 - 87.0,
                            child: Text(
                              'Welcome to Cinematix, ${userState.user.name}',
                              style: whiteTextFont,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text('Mau Nonton Film apa hari ini?',
                              style: whiteTextFont)
                        ],
                      )
                    ],
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: Loading2(height: 40, width: 40),
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
