part of 'widgets.dart';

class CommingSoonCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  CommingSoonCard({
    this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 180,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: borderRadius8,
          image: DecorationImage(
            image: ((imageBaseUrl + 'w780' + movie.backdropPath) != null)
                ? NetworkImage(imageBaseUrl + 'w780' + movie.backdropPath)
                : AssetImage('assets/error-404.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 180,
          width: 120,
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
            children: <Widget>[
              Text(
                movie.title,
                style: whiteTextFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
