part of 'widgets.dart';

class BackButtonAndText extends StatelessWidget {
  final Function onTap;
  final String text1;
  final String text2;

  BackButtonAndText({
    this.onTap,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Icon(Icons.arrow_back),
            ),
          ),
          Text(
            text1,
            style: blackTextFont.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 5),
          Text(text2, style: blackTextFont3),
        ],
      ),
    );
  }
}
