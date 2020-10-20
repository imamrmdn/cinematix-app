part of 'screens.dart';

class MyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEDEDED),
      child: Center(
        child: GestureDetector(
          onTap: () {
            context.bloc<UserBloc>().add(SignOut());
            AuthServices.signOut();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/signout.svg', height: 50.0),
              SizedBox(width: 10),
              Text('Sign Out',
                  style: blueTextFont.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
