part of 'screens.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, userState) => Stack(
        children: <Widget>[
          //body listview
          Container(
            width: SizeConfig.defaultWidth,
            height: SizeConfig.defaultHeight,
            color: Color(0xFFEDEDED),
            padding: EdgeInsets.only(top: 170.0, bottom: 70.0),
            child: SafeArea(
              minimum: EdgeInsets.only(left: 25.0, right: 25.0),
              child: ListView(
                children: <Widget>[
                  Text(
                    'Pilih Film yang Sedang Tayang',
                    style: blackTextFont.copyWith(
                        fontSize: 18.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //list movie
                  SizedBox(
                    height: 140.0,
                    child: BlocBuilder<MovieBloc, MovieState>(
                        builder: (_, moviesState) {
                      if (moviesState is MovieLoaded) {
                        List<Movie> movies = moviesState.movies.sublist(0, 10);
                        return CarouselSlider.builder(
                            options: CarouselOptions(
                              aspectRatio: 16 / 9,
                              disableCenter: true,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 2),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 500),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemCount: movies.length,
                            itemBuilder: (_, index) {
                              return Container(
                                child: MovieCard(
                                  movie: movies[index],
                                  onTap: () {
                                    context.bloc<ScreenBloc>().add(
                                        GoToMovieDetailScreen(movies[index]));
                                  },
                                ),
                              );
                            });
                      } else {
                        return Loading(
                          width: 50.0,
                          height: 50.0,
                        );
                      }
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //todo: category genre
                  Text(
                    'Kategori Genre Pilihanmu',
                    style: blackTextFont.copyWith(
                        fontSize: 18.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //
                  BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                    if (userState is UserLoaded) {
                      List<Widget> genre = List.generate(
                        userState.user.selectedGenres.length,
                        (index) {
                          return GenreCard(
                            userState.user.selectedGenres[index],
                            onTap: () {
                              print(userState.user.selectedGenres[index]);
                            },
                          );
                        },
                      );

                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: genre,
                        ),
                      );
                    } else {
                      return Loading(
                        width: 50.0,
                        height: 50.0,
                      );
                    }
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  //list film comming soon
                  Text(
                    'Comming Soon',
                    style: blackTextFont.copyWith(
                        fontSize: 18.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 140.0,
                    child: BlocBuilder<MovieBloc, MovieState>(
                        builder: (_, moviesState) {
                      if (moviesState is MovieLoaded) {
                        List<Movie> movies = moviesState.movies.sublist(10);
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                child: CommingSoonCard(
                                  movie: movies[index],
                                  onTap: () {
                                    return showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Icon(MdiIcons.informationOutline,
                                                color: accentColor2, size: 50),
                                            Text(
                                                'Film ${movies[index].title} Belum Tayang',
                                                style: blackTextFont),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            });
                      } else {
                        return Loading(
                          width: 50.0,
                          height: 50.0,
                        );
                      }
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //promo
                  Text(
                    'Promo Untuk Kamu',
                    style: blackTextFont.copyWith(
                        fontSize: 18.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: dataPromo
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: PromoCard(e),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          //header
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 40.0, right: 40.0),
            width: SizeConfig.defaultWidth,
            height: 130.0,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (_, userState) {
                if (userState is UserLoaded) {
                  if (imageFileUpload != null) {
                    uploadImage(imageFileUpload).then((downloadURL) {
                      imageFileUpload = null;
                      context
                          .bloc<UserBloc>()
                          .add(UpdateData(profilePicture: downloadURL));
                    });
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //profile picture
                      Container(
                        padding: EdgeInsets.all(3),
                        height: 65.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: whiteColor, width: 1),
                        ),
                        child: (userState.user.profilePicture != "")
                            ? CachedNetworkImage(
                                imageUrl: userState.user.profilePicture,
                                progressIndicatorBuilder: (context, url,
                                        downloadProgress) =>
                                    SpinKitPulse(
                                        color: Colors.red[300],
                                        controller: AnimationController(
                                            vsync: this,
                                            value: downloadProgress.progress,
                                            duration: const Duration(
                                                milliseconds: 1200))),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 65.0,
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 65.0,
                                height: 65.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/user_picture.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                      ),
                      SizedBox(width: 10),
                      //
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8.0),
                          SizedBox(
                            width: SizeConfig.defaultWidth - 2 * 40.0 - 87.0,
                            child: Text(
                              'Welcome to Cinematix, ${userState.user.name}',
                              style: whiteTextFont,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text('Mau Nonton Film apa hari ini?',
                              style: whiteTextFont)
                        ],
                      )
                    ],
                  );
                } else {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Loading2(height: 40.0, width: 40),
                  );
                }
              },
            ),
          ),
          MyWallet(
              balance: (userState is UserLoaded)
                  ? formatNumber(userState.user.balance)
                  : 'Loading ...')
        ],
      ),
    );
  }
}
