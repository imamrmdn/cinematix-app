part of 'models.dart';

class Bioskop extends Equatable {
  final String nama;

  Bioskop(this.nama);

  @override
  List<Object> get props => [nama];
}

List<Bioskop> listBioskop = [
  Bioskop('CGV Sunter Mall Jakarta Utara'),
  Bioskop('XXI Kelapa Gading Jakarta Utara'),
  Bioskop('CINEMA21 Kelapa Gading Jakarta Utara'),
  Bioskop('CGV MOI Jakarta Utara'),
];
