part of 'models.dart';

class MovieDetail extends Movie {
  final List<String> genres;
  final String language;

  MovieDetail(
    Movie movie, {
    this.genres,
    this.language,
  }) : super(
          //memanggail constructor parentny yaitu si movie class/model
          id: movie.id,
          title: movie.title,
          voteAverage: movie.voteAverage,
          overview: movie.overview,
          posterPath: movie.posterPath,
          backdropPath: movie.backdropPath,
        );

  String get genresAndLanguage {
    String g = '';

    for (var genre in genres) {
      g += genre + (genre != genres.last ? ', ' : '');
    }

    return '$g - $language';
  }

  @override
  List<Object> get props => super.props + [genres, language];
}
