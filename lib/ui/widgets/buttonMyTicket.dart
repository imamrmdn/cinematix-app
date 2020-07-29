part of 'widgets.dart';

class MyTicketButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(bottom: 42),
        child: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyTicketScreen()));
          },
          child: Icon(MdiIcons.ticket),
        ),
      ),
    );
  }
}
