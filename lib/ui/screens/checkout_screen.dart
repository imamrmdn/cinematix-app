part of 'screens.dart';

class CheckOutScreen extends StatefulWidget {
  final Ticket ticket;

  CheckOutScreen(this.ticket);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    int total = 27000 * widget.ticket.seats.length;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToSelectSeatsScreen(widget.ticket));
        return;
      },
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(20),
          child: Center(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (_, userState) {
                User user = (userState as UserLoaded).user;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Check Out Movie',
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    //gambar
                    Container(
                      height: 180,
                      width: SizeConfig.defaultWidth,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius8,
                        image: DecorationImage(
                          image: NetworkImage(imageBaseUrl +
                              'w342' +
                              widget.ticket.movieDetail.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      widget.ticket.movieDetail.title,
                      style: blackTextFont,
                    ),
                    Divider(color: mainColor, thickness: 2),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('ORDER ID:', style: blackTextFont),
                        Text(
                          '${widget.ticket.bookingCode}',
                          style: blackTextFont.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Cinema:', style: blackTextFont),
                        Text(
                          '${widget.ticket.bioskop.nama}',
                          style: blackTextFont,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Date & Time:', style: blackTextFont),
                        Text(
                          '${widget.ticket.time.dateAndTime}',
                          style: blackTextFont,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('SeatNumber:', style: blackTextFont),
                        Text(
                          '${widget.ticket.seatsInString}',
                          style: blackTextFont,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Price:', style: blackTextFont),
                        Text(
                          '25.000 X ${widget.ticket.seats.length}',
                          style: blackTextFont,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Fee Admin:', style: blackTextFont),
                        Text(
                          '2.000 X ${widget.ticket.seats.length}',
                          style: blackTextFont,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Total:', style: blackTextFont),
                        Text(
                          '${formatNumber(total)}',
                          style: blackTextFont.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(height: 20, color: mainColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Dompet Digital Mu:', style: blackTextFont),
                        Text(
                          '${formatNumber(user.balance)}',
                          style: blackTextFont.copyWith(
                            fontWeight: FontWeight.bold,
                            color: user.balance > total
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 250,
                      height: 50,
                      child: RaisedButton(
                        color: user.balance >= total
                            ? Color(0xFF3E9D9D)
                            : mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius8,
                        ),
                        child: Text(
                          user.balance >= total
                              ? 'Check Out Sekarang'
                              : 'Top Up Wallet',
                          style: whiteTextFont,
                        ),
                        onPressed: () {
                          if (user.balance >= total) {
                            print('uangcukup');
                            CinematixTransaction transaction =
                                CinematixTransaction(
                              userID: user.id,
                              title: widget.ticket.movieDetail.title,
                              subtitle: widget.ticket.bioskop.nama,
                              time: DateTime.now(),
                              amount: -total,
                              picture: widget.ticket.movieDetail.posterPath,
                            );
                            //
                            context.bloc<ScreenBloc>().add(GoToSuccesScreen(
                                widget.ticket.copyWith(totalPrice: total),
                                transaction));
                          } else {
                            print('uangtidakcukup');
                          }
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
