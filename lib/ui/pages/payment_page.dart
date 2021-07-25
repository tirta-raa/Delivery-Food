part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});
  @override
  Widget build(BuildContext context) {
    Widget itemOrder() {
      return Column(
        children: [
          Text(
            'Item Order',
            style: blackFontStyle3,
          ),
          SizedBox(
            height: 12,
          ),
        ],
      );
    }

    Widget detailOrder() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // ? Food Picture ?

              Container(
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
              ),

              // ? Food Name ?

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 189,
                    // ? 2 * default margin +
                    // ? 60 ukuran gambar +
                    // ? 12 margin dari foto ke tulisan ini +
                    // ? 78 lebar jumlah item +
                    child: Text(
                      transaction.food.name,
                      style: blackFontStyle2,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),

                  // ? Food Price ?

                  Text(
                    NumberFormat.currency(
                            locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                        .format(transaction.food.price),
                    style: greyFontStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),

          // ? Total Item ?

          Text(
            '${transaction.quantity} item(s)',
            style: greyFontStyle.copyWith(fontSize: 13),
          ),
        ],
      );
    }

    Widget detailText() {
      return Padding(
        padding: EdgeInsets.only(top: 16, bottom: 8),
        child: Text(
          'Details Transaction',
          style: blackFontStyle3,
        ),
      );
    }

    Widget detailFoodPrice() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? Food Name ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              transaction.food.name,
              style: greyFontStyle,
            ),
          ),

          // ? Food Price ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              NumberFormat.currency(
                      locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                  .format(
                transaction.food.price * transaction.quantity,
              ),
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget costDelivery() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? Delivery text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'Driver',
              style: greyFontStyle,
            ),
          ),

          // ? Delivery Price ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              NumberFormat.currency(
                      locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                  .format(50000),
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget tax() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? Tax Text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'Tax 10%',
              style: greyFontStyle,
            ),
          ),

          // ? Tax Price ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              NumberFormat.currency(
                      locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                  .format(
                transaction.food.price * transaction.quantity * 0.1,
              ),
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget totalPrice() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? Total text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'Total Price',
              style: greyFontStyle,
            ),
          ),

          // ? Total Price ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              NumberFormat.currency(
                      locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaction.food.price * transaction.quantity * 1.1 +
                      50000),
              style: blackFontStyle3.copyWith(
                fontWeight: FontWeight.w500,
                color: '1ABC9C'.toColor(),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget deliverToText() {
      return Padding(
        padding: EdgeInsets.only(top: 16, bottom: 8),
        child: Text(
          'Deliver To',
          style: blackFontStyle3,
        ),
      );
    }

    Widget namePerson() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? Name text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'Name',
              style: greyFontStyle,
            ),
          ),

          // ? Name User ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              transaction.user.name,
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget phoneNumber() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? Phone text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'Phone No',
              style: greyFontStyle,
            ),
          ),

          // ? Phone User ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              transaction.user.phoneNumber,
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget address() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? Address text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'Adress',
              style: greyFontStyle,
            ),
          ),

          // ? Address User ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              transaction.user.address,
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget houseNumber() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? House Number text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'House No',
              style: greyFontStyle,
            ),
          ),

          // ? House Number User ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              transaction.user.houseNumber,
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget city() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ? City text ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              'City',
              style: greyFontStyle,
            ),
          ),

          // ? City User ?

          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
            child: Text(
              transaction.user.city,
              style: blackFontStyle3,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget buttonChekout() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: RaisedButton(
          onPressed: () {},
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: mainColor,
          child: Text(
            'Chekout Now',
            style: blackFontStyle3,
          ),
        ),
      );
    }

    return GeneralPage(
      title: 'Payment',
      subtitle: 'Payment page',
      onBackButtonPressed: () {},
      backColor: 'FAFAFC'.toColor(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemOrder(),
                detailOrder(),
                detailText(),
                detailFoodPrice(),
                costDelivery(),
                tax(),
                totalPrice(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                deliverToText(),
                namePerson(),
                phoneNumber(),
                address(),
                houseNumber(),
                city(),
              ],
            ),
          ),
          buttonChekout(),
        ],
      ),
    );
  }
}
