part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime date;
  final Function onTap;

  DateCard(this.date,
      {this.isSelected = false, this.height = 90, this.width = 70, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius8,
          color: isSelected ? mainColor : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : greyColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(date.shortDayName),
            SizedBox(height: 5),
            Text('${date.day}'),
          ],
        ),
      ),
    );
  }
}
