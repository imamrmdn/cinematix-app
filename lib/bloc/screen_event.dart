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

class GoToMovieDetailScreen extends ScreenEvent {
  final Movie movie;

  GoToMovieDetailScreen(this.movie);

  @override
  List<Object> get props => [movie];
}

class GoToSelectDateScreen extends ScreenEvent {
  final MovieDetail movieDetail;

  GoToSelectDateScreen(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class GoToSelectSeatsScreen extends ScreenEvent {
  final Ticket ticket;

  GoToSelectSeatsScreen(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToCheckOutScreen extends ScreenEvent {
  final Ticket ticket;

  GoToCheckOutScreen(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToSuccesScreen extends ScreenEvent {
  final Ticket ticket;
  final CinematixTransaction transaction;

  GoToSuccesScreen(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}
