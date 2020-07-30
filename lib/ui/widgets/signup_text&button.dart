part of 'widgets.dart';

class SignUpTextAndButton extends StatelessWidget {
  final Function onTap;

  SignUpTextAndButton({this.onTap});

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
            'Sign Up',
            style: blackTextFont.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 5),
          Text('Masukan data dibawah ini untuk melakukan Sign Up',
              style: blackTextFont3),
        ],
      ),
    );
  }
}
