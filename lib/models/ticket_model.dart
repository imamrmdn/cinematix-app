part of 'models.dart';

class Ticket extends Equatable {
  final MovieDetail movieDetail;
  final Bioskop bioskop;
  final DateTime time;
  final String bookingCode;
  final List<String> seats;
  final String name;
  final int totalPrice;

  Ticket(this.movieDetail, this.bioskop, this.time, this.bookingCode,
      this.seats, this.name, this.totalPrice);

  Ticket copyWith({
    MovieDetail movieDetail,
    Bioskop bioskop,
    DateTime time,
    String bookingCode,
    List<String> seats,
    String name,
    int totalPrice,
  }) {
    return Ticket(
      movieDetail ?? this.movieDetail,
      bioskop ?? this.bioskop,
      time ?? this.time,
      bookingCode ?? this.bookingCode,
      seats ?? this.seats,
      name ?? this.name,
      totalPrice ?? this.totalPrice,
    );
  }

  String get seatsInString {
    String s = '';

    for (var seat in seats) {
      s += seat + ((seat != seats.last) ? ', ' : '');
    }
    return s;
  }

  @override
  List<Object> get props => [
        movieDetail,
        bioskop,
        time,
        bookingCode,
        seats,
        name,
        totalPrice,
      ];
}
