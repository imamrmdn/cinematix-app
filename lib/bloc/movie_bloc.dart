import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cinematix_app/models/models.dart';
import 'package:cinematix_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchMovies) {
      List<Movie> movies = await MovieService.getMovie(4);

      yield MovieLoaded(movies: movies);
    }
  }
}
