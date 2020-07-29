part of 'screens.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var index = [];
    for (int i = 0; i <= 100; i++) {
      index.add(i);
    }

    return Stack(
      children: <Widget>[
        //body listview
        Container(
          padding: EdgeInsets.only(
              top: 170.0, bottom: 100.0, left: 30.0, right: 30.0),
          width: SizeConfig.defaultWidth,
          height: SizeConfig.defaultHeight,
          color: Color(0xFFEDEDED),
          child: ListView.builder(
            itemCount: index.length,
            itemBuilder: (_, i) => Text('Test $i'),
          ),
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
        TopUpWidget(balance: 'Rp. 5000.000')
      ],
    );
  }
}
