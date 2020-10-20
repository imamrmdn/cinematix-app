part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo({
    @required this.title,
    @required this.subtitle,
    @required this.discount,
  });

  @override
  List<Object> get props => [
        title,
        subtitle,
        discount,
      ];
}

List<Promo> dataPromo = [
  Promo(
    title: 'Untuk Mahasiswa',
    subtitle: 'Maksimal untuk 4 orang',
    discount: 50,
  ),
  Promo(
    title: 'Bersama Keluarga',
    subtitle: 'Maksimal untuk 3 orang',
    discount: 70,
  ),
  Promo(
    title: 'Untuk Member Cinematix',
    subtitle: 'Maksimal untuk 1 orang',
    discount: 30,
  ),
];
