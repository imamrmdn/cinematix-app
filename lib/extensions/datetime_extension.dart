part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String get shortDayName {
    switch (this.weekday) {
      case 1:
        return 'Sen';
      case 2:
        return 'Sel';
      case 3:
        return 'Rab';
      case 4:
        return 'Kam';
      case 5:
        return 'Jum';
      case 6:
        return 'Sab';
      default:
        return 'Min';
    }
  }

  String get dateAndTime {
    return '${this.shortDayName} ${this.day}, ${this.hour}:00';
  }
}
