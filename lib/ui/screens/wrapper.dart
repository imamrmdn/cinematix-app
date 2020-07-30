part of 'screens.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      //mengecek halaman sebelumnya agar tidak masuk ke halaman yg sama 2x
      if (!(prevScreenEvent is GoToOnBoardingScreen)) {
        prevScreenEvent = GoToOnBoardingScreen();
        context.bloc<ScreenBloc>().add(prevScreenEvent);
      }
    } else {
      if (!(prevScreenEvent is GoToHomeScreen)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevScreenEvent = GoToHomeScreen();
        context.bloc<ScreenBloc>().add(prevScreenEvent);
      }
    }

    return BlocBuilder<ScreenBloc, ScreenState>(
        builder: (_, screenState) => (screenState is OnOnBoardingScreen)
            ? OnBoardingScreen()
            : (screenState is OnSignInScreen)
                ? SignInScreen()
                : (screenState is OnRegistrationScreen)
                    ? SignUpScreen(screenState.registration)
                    : HomeScreen());
  }
}
