part of 'widgets.dart';

class GenreCard extends StatelessWidget {
  final String genre;
  final Function onTap;

  GenreCard(this.genre, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius8,
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(handleGenre(genre)),
                ),
              ),
            ),
          ),
        ),
        Text(genre, style: blackTextFont),
      ],
    );
  }
}
