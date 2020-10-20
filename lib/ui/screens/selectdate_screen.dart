part of 'screens.dart';

class SelectDateScreen extends StatefulWidget {
  final MovieDetail movieDetail;

  SelectDateScreen(this.movieDetail);

  @override
  _SelectDateScreenState createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectTime;
  Bioskop selectBioskop;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<ScreenBloc>()
            .add(GoToMovieDetailScreen(widget.movieDetail));
        return;
      },
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            //pilih tanggal
            Container(
              margin: EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Text(
                'Pilih Tanggal',
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: (index == 0) ? 24 : 0,
                      right: (index < dates.length - 1) ? 16 : 24,
                    ),
                    child: DateCard(
                      dates[index],
                      isSelected: selectedDate == dates[index],
                      onTap: () {
                        setState(() {
                          selectedDate = dates[index];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            //pilih jam di teater
            generateTimeTable(),
            //
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) {
                  return FloatingActionButton(
                    elevation: 0,
                    backgroundColor: (isValid) ? mainColor : greyColor,
                    child: Icon(Icons.arrow_forward,
                        color: isValid ? whiteColor : whiteColor),
                    onPressed: () {
                      //
                      if (isValid) {
                        context.bloc<ScreenBloc>().add(
                              GoToSelectSeatsScreen(
                                Ticket(
                                  widget.movieDetail,
                                  selectBioskop,
                                  DateTime(selectedDate.day, selectedDate.month,
                                      selectedDate.year, selectTime),
                                  randomAlphaNumeric(12).toUpperCase(),
                                  null,
                                  (userState as UserLoaded).user.name,
                                  null,
                                ),
                              ),
                            );
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Column generateTimeTable() {
    List<int> jadwal = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var bioskop in listBioskop) {
      widgets.add(
        Container(
          margin: EdgeInsets.fromLTRB(24, 0, 24, 20),
          child:
              Text(bioskop.nama, style: blackTextFont.copyWith(fontSize: 20)),
        ),
      );
      //
      widgets.add(Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: jadwal.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(
                left: (index == 0) ? 24 : 0,
                right: (index < dates.length - 1) ? 16 : 24,
              ),
              child: SelectableBox(
                '${jadwal[index]} :00',
                height: 50,
                isSelected:
                    selectBioskop == bioskop && selectTime == jadwal[index],
                isEnabled: jadwal[index] > DateTime.now().hour ||
                    selectedDate.day != DateTime.now().day,
                onTap: () {
                  setState(() {
                    selectBioskop = bioskop;
                    selectTime = jadwal[index];
                    if (jadwal[index] > DateTime.now().hour ||
                        selectedDate.day != DateTime.now().day) {
                      isValid = true;
                    } else {
                      isValid = false;
                    }
                  });
                  print('$selectTime:00');
                },
              ),
            );
          },
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
