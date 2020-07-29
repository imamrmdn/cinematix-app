part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            //bodylistview
            PageView(
              controller: pageController,
              children: <Widget>[
                MovieScreen(),
                SettingScreen(),
              ],
              onPageChanged: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                });
              },
            ),
            //bottomnavbar
            BottomNavBarCustom(
              currentIndex: bottomNavBarIndex,
              onTap: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Image.asset((bottomNavBarIndex == 0)
                        ? 'assets/new_movie.png'
                        : 'assets/new_movie_grey.png'),
                  ),
                  title: Text(
                    'New Movie',
                    style: (bottomNavBarIndex == 0)
                        ? blackTextFont.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )
                        : greyTextFont,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Image.asset((bottomNavBarIndex == 1)
                        ? 'assets/setting.png'
                        : 'assets/setting_grey.png'),
                  ),
                  title: Text(
                    'Setting',
                    style: (bottomNavBarIndex == 1)
                        ? blackTextFont.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )
                        : greyTextFont,
                  ),
                ),
              ],
            ),
            MyTicketButton(),
          ],
        )));
  }
}
