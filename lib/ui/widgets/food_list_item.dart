part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidht;

  const FoodListItem({Key key, @required this.food, @required this.itemWidht})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(food.picturePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidht - 182,
          // * angka 182 di dapaat dari penjumlahan lebar gambar (widh 80) jarak dari gambar ke text (margin 12)  jarak ke rating star (110)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                // food.price.toString(),
                // *kode di atas di gunakan sebelum menambahkan mata uang
                NumberFormat.currency(
                        symbol: 'IDR ', decimalDigits: 0, locale: 'id -ID')
                    .format(food.price),
                style: greyFontStyle.copyWith(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        RatingStars(food.rate),
      ],
    );
  }
}
