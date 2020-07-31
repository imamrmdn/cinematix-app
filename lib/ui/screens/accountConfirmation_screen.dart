part of 'screens.dart';

class AccountConfirmScreen extends StatefulWidget {
  final Registration registration;

  AccountConfirmScreen(this.registration);

  @override
  _AccountConfirmScreenState createState() => _AccountConfirmScreenState();
}

class _AccountConfirmScreenState extends State<AccountConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<ScreenBloc>()
            .add(GoToPreferenceScreen(widget.registration));
        return;
      },
      child: Scaffold(
        body: Center(
          child: Text('Soon'),
        ),
      ),
    );
  }
}
