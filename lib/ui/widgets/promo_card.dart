part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: borderRadius8,
        border: Border.all(
          color: blackColor.withOpacity(0.6),
          width: 0.2,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300].withOpacity(0.6),
              highlightColor: Colors.grey[100],
              child: Container(
                width: 110,
                height: 45,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(2),
                      topRight: Radius.circular(45),
                    )),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300].withOpacity(0.6),
              highlightColor: Colors.grey[100],
              child: Container(
                width: 110,
                height: 55,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      topRight: Radius.circular(2),
                    )),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(promo.title, style: whiteTextFont),
                    Text(promo.subtitle, style: whiteTextFont),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('OFF ',
                        style: whiteTextFont2.copyWith(
                            color: accentColor2, fontWeight: FontWeight.bold)),
                    Text('${promo.discount}%',
                        style: whiteTextFont2.copyWith(
                            color: accentColor2, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
