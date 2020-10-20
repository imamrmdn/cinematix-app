part of 'screens.dart';

class SuccesScreen extends StatelessWidget {
  final Ticket ticket;
  final CinematixTransaction transaction;

  SuccesScreen(this.ticket, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
            future: ticket != null
                ? processingTicketOrder(context)
                : processingTopUp(context),
            builder: (_, snapshot) =>
                (snapshot.connectionState == ConnectionState.done)
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text('Go To Home'),
                            onPressed: () {
                              context.bloc<ScreenBloc>().add(GoToHomeScreen());
                            },
                          ),
                          RaisedButton(
                            child: Text('Go To Ticket Screen'),
                            onPressed: () {
                              //
                            },
                          ),
                        ],
                      ))
                    : Center(child: CircularProgressIndicator())),
      ),
    );
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(ticket.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(ticket, transaction.userID));

    await CinematixTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp(BuildContext context) {}
}
