part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.defaultMargin, //24
                            ),
                            child: Text(userState.user.name),
                          ),
                          Text(userState.user.email),
                        ],
                      )
                    : Text('----'),
              ),
              RaisedButton(
                onPressed: () {
                  AuthServices.signOut();
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
