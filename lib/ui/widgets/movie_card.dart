part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  MovieCard({
    this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: borderRadius8,
          image: DecorationImage(
            image: (imageBaseUrl + 'w780' + movie.backdropPath != null)
                ? NetworkImage(imageBaseUrl + 'w780' + movie.backdropPath)
                : NetworkImage(
                    'https://i1.wp.com/saedx.com/blog/wp-content/uploads/2019/01/saedx-blog-featured-70.jpg?fit=1200%2C500&ssl=1'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 180,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: borderRadius8,
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.61),
                Colors.black.withOpacity(0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: whiteTextFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingStars(
                voteAverage: movie.voteAverage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
