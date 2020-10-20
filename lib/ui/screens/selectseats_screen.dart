part of 'screens.dart';

class SelectSeatsScreen extends StatefulWidget {
  final Ticket ticket;

  SelectSeatsScreen(this.ticket);

  @override
  _SelectSeatsScreenState createState() => _SelectSeatsScreenState();
}

class _SelectSeatsScreenState extends State<SelectSeatsScreen> {
  List<String> selectSeats = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<ScreenBloc>()
            .add(GoToSelectDateScreen(widget.ticket.movieDetail));
        return;
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius8,
                    image: DecorationImage(
                      image: NetworkImage(imageBaseUrl +
                          'w154' +
                          widget.ticket.movieDetail.posterPath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '${widget.ticket.movieDetail.title}',
                  style: blackTextFont.copyWith(fontSize: 16),
                ),
                SizedBox(height: 50),
                //select seats
                generateSeats(),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    elevation: selectSeats.length > 0 ? 3 : 0,
                    backgroundColor:
                        selectSeats.length > 0 ? mainColor : greyColor,
                    child: Icon(Icons.arrow_forward, color: whiteColor),
                    onPressed: selectSeats.length > 0
                        ? () {
                            //todo checkout
                            context
                                .bloc<ScreenBloc>()
                                .add(GoToCheckOutScreen(widget.ticket.copyWith(
                                  seats: selectSeats,
                                )));
                          }
                        : null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numberOfSeats[i],
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableBox(
                '${String.fromCharCode(i + 65)}${index + 1}',
                width: 65,
                height: 65,
                isSelected: selectSeats
                    .contains('${String.fromCharCode(i + 65)}${index + 1}'),
                onTap: () {
                  String seatNumber =
                      '${String.fromCharCode(i + 65)}${index + 1}';
                  setState(() {
                    if (selectSeats.contains(seatNumber)) {
                      selectSeats.remove(seatNumber);
                    } else {
                      selectSeats.add(seatNumber);
                    }
                  });
                },
                isEnabled: index != 0,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: widgets,
    );
  }
}
