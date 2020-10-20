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

class OnMovieDetailScreen extends ScreenState {
  final Movie movie;

  OnMovieDetailScreen(this.movie);

  @override
  List<Object> get props => [movie];
}

class OnSelectDateScreen extends ScreenState {
  final MovieDetail movieDetail;

  OnSelectDateScreen(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnSelectSeatsScreen extends ScreenState {
  final Ticket ticket;

  OnSelectSeatsScreen(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnCheckOutScreen extends ScreenState {
  final Ticket ticket;

  OnCheckOutScreen(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnSuccesScreen extends ScreenState {
  final Ticket ticket;
  final CinematixTransaction transaction;

  OnSuccesScreen(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}
