part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double rate;

  RatingStars(this.rate);
  // *dibuat sebuah bilangan dengan nama rate

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();
    // *arti kode di atas kita bikin integer dengan nama numberofstar di ambil dari rate di bulatkan

    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < numberOfStars) ? MdiIcons.star : MdiIcons.starOutline,
              size: 16,
              color: mainColor,
            ),
            // *arti kode di atas dibuat icon bintang dengan panjang 5 jika index lebih kecil dari numberofstar
            // * maka munculkan bintang warna penuh kalau tidak munculkan warna bintang outline saja
          ) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: greyFontStyle.copyWith(
                fontSize: 12,
              ),
            )
          ],
    );
  }
}
