part of 'screens.dart';

class OnBoardingScreen extends StatelessWidget {
  final controller = PageController();
  final List<Widget> onBoardingScreenList = [
    OnBoardingScreenOne(),
    OnBoardingScreenTwo(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            itemCount: onBoardingScreenList.length,
            itemBuilder: (context, index) => onBoardingScreenList[index],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? SizeConfig.defaultWidth / 1.7
                        : SizeConfig.defaultWidth / 1.6,
              ),
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(
                  activeDotColor: mainColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
