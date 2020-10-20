part of 'screens.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> credits;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToHomeScreen());
        return;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              FutureBuilder(
                  future: MovieService.getDetails(movie),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      movieDetail = snapshot.data;
                    }

                    return Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            // note: BACKDROP
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 270,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(imageBaseUrl +
                                                  "w1280" +
                                                  movie.backdropPath ??
                                              movie.posterPath),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 271,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment(0, 1),
                                          end: Alignment(0, 0.06),
                                          colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0)
                                      ])),
                                )
                              ],
                            ),
                            // note: BACK ICON
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 20),
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.04)),
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .bloc<ScreenBloc>()
                                      .add(GoToHomeScreen());
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        // note: JUDUL
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 16, 10, 6),
                          child: Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(fontSize: 24),
                          ),
                        ),
                        // note: GENRE
                        (snapshot.hasData)
                            ? Text(
                                movieDetail.genresAndLanguage,
                                style: greyTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            : SizedBox(
                                height: 50,
                                width: 50,
                                child: SpinKitFadingCircle(
                                  color: accentColor3,
                                ),
                              ),
                        SizedBox(
                          height: 6,
                        ),
                        // note: RATING
                        RatingStars(
                          voteAverage: movie.voteAverage,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        // note: CREDITS
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              margin: EdgeInsets.only(left: 10, bottom: 12),
                              child: Text(
                                "Cast & Crew",
                                style: blackTextFont.copyWith(fontSize: 14),
                              )),
                        ),
                        FutureBuilder(
                            future: MovieService.getCredits(movie.id),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                credits = snapshot.data;
                                return SizedBox(
                                  height: 110,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: credits.length,
                                    itemBuilder: (_, index) => Container(
                                      margin: EdgeInsets.only(
                                          left: (index == 0) ? 10 : 0,
                                          right: (index == credits.length - 1)
                                              ? 10
                                              : 16),
                                      child: CastCrewCard(credits[index]),
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox(
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: mainColor,
                                    ));
                              }
                            }),
                        // note: STORYLINE
                        Container(
                          margin: EdgeInsets.fromLTRB(12, 24, 12, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Storyline",
                              style: blackTextFont,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(12, 0, 12, 30),
                          child: Text(
                            movie.overview,
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        // note: BUTTON
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: mainColor,
                            child: Text(
                              "Continue to Book",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () {
                              context
                                  .bloc<ScreenBloc>()
                                  .add(GoToSelectDateScreen(movieDetail));
                            }),
                        SizedBox(height: 24)
                      ],
                    );
                  }),
            ],
          ),
        ],
      )),
    );
  }
}
