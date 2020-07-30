part of 'screen_bloc.dart';

abstract class ScreenEvent extends Equatable {
  const ScreenEvent();
}

class GoToOnBoardingScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToHomeScreen extends ScreenEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationScreen extends ScreenEvent {
  final Registration registration;

  GoToRegistrationScreen(this.registration);

  @override
  List<Object> get props => [];
}

class GoToPreferenceScreen extends ScreenEvent {
  final Registration registration;

  GoToPreferenceScreen(this.registration);

  @override
  List<Object> get props => [];
}

class GoToAccountConfimationScreen extends ScreenEvent {
  final Registration registration;

  GoToAccountConfimationScreen(this.registration);

  @override
  List<Object> get props => [];
}
