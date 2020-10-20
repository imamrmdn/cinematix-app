part of 'models.dart';

class CinematixTransaction extends Equatable {
  final String userID;
  final String title;
  final String subtitle;
  final int amount;
  final DateTime time;
  final String picture;

  CinematixTransaction({
    @required this.userID,
    @required this.title,
    @required this.subtitle,
    @required this.time,
    this.amount = 0,
    this.picture,
  });

  @override
  List<Object> get props => [
        userID,
        title,
        subtitle,
        time,
        amount,
        picture,
      ];
}
