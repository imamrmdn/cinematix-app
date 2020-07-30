part of 'screen_bloc.dart';

abstract class ScreenState extends Equatable {
  const ScreenState();
}

class OnInitialScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnSignInScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnOnBoardingScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnHomeScreen extends ScreenState {
  @override
  List<Object> get props => [];
}

class OnRegistrationScreen extends ScreenState {
  final Registration registration;

  OnRegistrationScreen(this.registration);

  @override
  List<Object> get props => [];
}

class OnPreferenceScreen extends ScreenState {
  final Registration registration;

  OnPreferenceScreen(this.registration);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationScreen extends ScreenState {
  final Registration registration;

  OnAccountConfirmationScreen(this.registration);

  @override
  List<Object> get props => [];
}
