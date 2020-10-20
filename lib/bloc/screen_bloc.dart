import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cinematix_app/models/models.dart';
import 'package:equatable/equatable.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc(ScreenState initialState) : super(initialState);

  @override
  Stream<ScreenState> mapEventToState(ScreenEvent event) async* {
    if (event is GoToOnBoardingScreen) {
      yield OnOnBoardingScreen();
    } else if (event is GoToSignInScreen) {
      yield OnSignInScreen();
    } else if (event is GoToHomeScreen) {
      yield OnHomeScreen();
    } else if (event is GoToRegistrationScreen) {
      yield OnRegistrationScreen(event.registration);
    } else if (event is GoToPreferenceScreen) {
      yield OnPreferenceScreen(event.registration);
    } else if (event is GoToAccountConfimationScreen) {
      yield OnAccountConfirmationScreen(event.registration);
    } else if (event is GoToMovieDetailScreen) {
      yield OnMovieDetailScreen(event.movie);
    } else if (event is GoToSelectDateScreen) {
      yield OnSelectDateScreen(event.movieDetail);
    } else if (event is GoToSelectSeatsScreen) {
      yield OnSelectSeatsScreen(event.ticket);
    } else if (event is GoToCheckOutScreen) {
      yield OnCheckOutScreen(event.ticket);
    } else if (event is GoToSuccesScreen) {
      yield OnSuccesScreen(event.ticket, event.transaction);
    }
  }
}
