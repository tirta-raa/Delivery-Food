part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidht;

  OrderListItem({@required this.transaction, @required this.itemWidht});

  @override
  Widget build(BuildContext context) {
    Widget pictureFood() {
      return Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(transaction.food.picturePath),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget nameQuantityPriceFood() {
      return SizedBox(
        width: itemWidht - 182,
        // * angka 182 di dapaat dari penjumlahan lebar gambar (widh 80) jarak dari gambar ke text (margin 12)  jarak ke rating star (110)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.food.name,
              style: blackFontStyle2,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            Text(
              '${transaction.quantity} item(s). ' +
                  // food.price.toString(),
                  // *kode di atas di gunakan sebelum menambahkan mata uang
                  NumberFormat.currency(
                          symbol: 'IDR ', decimalDigits: 0, locale: 'id -ID')
                      .format(transaction.total),
              style: greyFontStyle.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

// ? arti text di bawah jika transaction.status sama dengan transactionstatus. canceleed makan tampilkan canceled dan sterusnya

    Widget dateTimeAndStatus() {
      return SizedBox(
        width: 110, // 110 di dapat dari panjang rating bintang
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              convertDateTime(transaction.dateTime),
              style: greyFontStyle.copyWith(fontSize: 12),
            ),
            (transaction.status == TransactionStatus.cancelled)
                ? Text(
                    'Cancelled',
                    style: GoogleFonts.poppins(
                        color: 'D9435E'.toColor(), fontSize: 10),
                  )
                : (transaction.status == TransactionStatus.pending)
                    ? Text(
                        'Pendding',
                        style: GoogleFonts.poppins(
                            color: 'D9435E'.toColor(), fontSize: 10),
                      )
                    : (transaction.status == TransactionStatus.on_delivery)
                        ? Text(
                            'On Delivery',
                            style: GoogleFonts.poppins(
                                color: '1ABC9C'.toColor(), fontSize: 10),
                          )
                        : SizedBox(),
          ],
        ),
      );
    }

    return Row(
      children: [
        pictureFood(),
        nameQuantityPriceFood(),
        dateTimeAndStatus(),
      ],
    );
  }

// ?kode di bawah artinya mengubah defaultnya date time jadi bulanya di ganti dari angka ke tulisan

  String convertDateTime(DateTime dateTime) {
    String month;
    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Dec';
    }
    return month + '${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
