part of 'widgets.dart';

class BottomNavBarCustom extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  final List<BottomNavigationBarItem> items;

  BottomNavBarCustom({
    this.currentIndex,
    this.onTap,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: Container(
          height: 70, //70
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: mainColor,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            onTap: onTap,
            items: items,
          ),
        ),
      ),
    );
  }
}
