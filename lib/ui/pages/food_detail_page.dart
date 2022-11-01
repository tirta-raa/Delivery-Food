part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  const FoodDetailPage({Key key, this.onBackButtonPressed, this.transaction})
      : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;

// * di tambah nama quantity ini berfungsi agar bisa menambah angka dari jumlah makanan yang di pesan

  @override
  Widget build(BuildContext context) {
    Widget backgroundCollors() {
      return Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    Widget imageHeader() {
      return SafeArea(
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.transaction.food.picturePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget whiteBackPressButton() {
      return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              if (widget.onBackButtonPressed != null) {
                widget.onBackButtonPressed();
              }
            },
            // * jika widget dari onbackbuttonpressed tidak sama dengan null maka widget munculkan widget onbackbuttonpressed
            child: Container(
              padding: const EdgeInsets.all(3),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black12,
              ),
              child: Image.asset('assets/back_arrow_white.png'),
            ),
          ),
        ),
      );
    }

    Widget titleAndRating() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 134,
            // *angka 134 di dapat dari padding horizontal 16 jadi karena atas bawah 16 di tambah 16 (16+16 = 32)
            // * kemudian di tambbah (26 + 26 = 52) angka ini diperoleh dari container widht height button min kemudian di tambah sizbok text quantity yang widhtnya 50 jadi totalnya 102
            // * 32+ 52 + 50 = 134
            child: Text(
              widget.transaction.food.name,
              style: blackFontStyle2,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          RatingStars(widget.transaction.food.rate),
        ],
      );
    }

    Widget addButton() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                quantity = max(1, quantity - 1);
              });
            },
            // * artinya ketika di klik akan berkurang dari satu tapi tidak bisa kurang dari 1
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1),
                image: const DecorationImage(
                  image: AssetImage('assets/btn_min.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              quantity.toString(),
              style: blackFontStyle2,
              textAlign: TextAlign.center,
            ),
            // * textnya di isi quantity karena angkanya akan selalu berubah
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                quantity = min(999, quantity + 1);
              });
            },
            // * ini maksimal bisa memesanya jadi ketika di klik maka akan menambah angkanya
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1),
                image: const DecorationImage(
                  image: AssetImage('assets/btn_add.png'),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget foodDesctription() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 14, 0, 16),
            child: Text(
              widget.transaction.food.description,
              style: greyFontStyle,
            ),
          ),
          Text(
            'Ingredients',
            style: blackFontStyle3,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 4, 0, 41),
            child: Text(
              widget.transaction.food.ingredients,
              style: greyFontStyle,
            ),
          ),
        ],
      );
    }

    Widget foodPrice() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Price :',
            style: greyFontStyle.copyWith(
              fontSize: 13,
            ),
          ),
          Text(
            NumberFormat.currency(
              locale: 'id-ID',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(quantity * widget.transaction.food.price),
            style: blackFontStyle2.copyWith(fontSize: 18),
          ),
        ],
      );
    }

    Widget buttonOrderNow() {
      return SizedBox(
        width: 163,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              PaymentPage(
                transaction: widget.transaction.copyWith(
                  quantity: quantity,
                  total: quantity * widget.transaction.food.price,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Order Now',
            style: blackFontStyle3.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          backgroundCollors(),
          imageHeader(),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    whiteBackPressButton(),

                    // * Body

                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      padding: const EdgeInsets.symmetric(
                          vertical: 26, horizontal: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              titleAndRating(),
                              addButton(),
                            ],
                          ),
                          foodDesctription(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              foodPrice(),
                              buttonOrderNow(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
