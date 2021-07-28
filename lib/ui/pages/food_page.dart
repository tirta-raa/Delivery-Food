part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;
  // *selectedIndex ini buat menentukan index dari item yang dipilih di mulai dari angka 0

  @override
  Widget build(BuildContext context) {
    double listItemWidht =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    // * lebar layar dikurangi 2x default margin

    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        color: Colors.white,
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Food Market',
                  style: blackFontStyle1,
                ),
                Text(
                  "Let's get some foods",
                  style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1499482125586-91609c0b5fd4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget cardOfFood() {
      return Container(
        height: 258,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: mockFoods
                  .map((e) => Padding(
                        padding: EdgeInsets.only(
                          left: (e == mockFoods.first) ? defaultMargin : 0,
                          right: defaultMargin,
                        ),
                        child: FoodCard(e),
                      ))
                  .toList(),
            )
          ],
        ),
      );
      // * arti kode di atas adalah di ambil mockup json dengan nama mockfood dari foodsmodels
      // * kemudian di map dengan nama e dengan kunci foodcard ambil data dari e
      // * kemudian di beri jarak hanya kiri jika e sama dengan food card yang pertama maka kasih default margin
      // * selain itu jangan di berikan jarak
      // * kemudian di peri padding kanan defaulr margin
      // * ambil to list
    }

    // Widget tabBar() {
    //   return Container(
    //     width: double.infinity,
    //     color: Colors.white,
    //     child: Column(
    //       children: [
    //         CustomTabBar(
    //           titles: ['New Taste', 'Popular', 'Recomended'],
    //           selectedIndex: selectedIndex,
    //           onTap: (index) {
    //             setState(() {
    //               selectedIndex = index;
    //             });
    //           },
    //         ),
    // * di buat customtabbar dari widget custom tab bar yang mengandung list string judul
    // * selected indexnya di pilih int selcted index yang ada di paling atas
    // * kemudian ontap dari custom tabbar di buat sendiri dengan isi index
    // * kemudian setstate selected index sama dengan index
    //         SizedBox(
    //           height: 16,
    //         ),
    //         Builder(
    //           builder: (_) {
    //             String body = (selectedIndex == 0)
    //                 ? 'New Taste Body'
    //                 : (selectedIndex == 1)
    //                     ? 'Popular Body'
    //                     : 'Recomended Body';
    //             return Center(
    //               child: Text(
    //                 body,
    //                 style: blackFontStyle2,
    //               ),
    //             );
    //           },
    // * di buat builder dengan nama parameter body mengandung string
    // * jika selected index sama dengan 0 maka tampilkna new taste body
    // * selain itu jika yang dipilih selected index sama dengan 1 maka tampilkan popular bidy
    // *  selain itu tampilkan recomeded body
    // * bilangan 0 da` saty ity di ambil dari gestur detector ontap yang ada di custtom tabbar
    //         ),
    //         SizedBox(
    //           height: 80,
    //         ),
    //       ],
    //     ),
    //   );
    // }

// * tabbar di bawah digunakan ketika sudah di masukan foodlistitem karena ada sedikit perbedaan pada buildernya
    Widget tabBar() {
      return Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            CustomTabBar(
              titles: ['New Taste', 'Popular', 'Recomended'],
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),

            // * di buat customtabbar dari widget custom tab bar yang mengandung list string judul
            // * selected indexnya di pilih int selcted index yang ada di paling atas
            // * kemudian ontap dari custom tabbar di buat sendiri dengan isi index
            // * kemudian setstate selected index sama dengan index

            SizedBox(
              height: 16,
            ),
            Builder(
              builder: (_) {
                List<Food> foods = (selectedIndex == 0)
                    ? mockFoods
                    : (selectedIndex == 1)
                        ? []
                        : [];
                return Column(
                  children: foods
                      .map((e) => Padding(
                            padding: EdgeInsets.fromLTRB(
                                defaultMargin, 0, defaultMargin, 16),
                            child:
                                FoodListItem(food: e, itemWidht: listItemWidht),
                          ))
                      .toList(),
                );
              },
            ),

            //  * dibuat builder dengan fungsi _  kemudian tampilkan list of food models dengan nama foods
            //  * sama dengan dalam kurung selected index sama dengan 0 karena itu halaman pertama yang akan di pilih
            //  * jika selected index sama dengan nol maka tampilkan mockFoods selai itu jika selected index sama dengan satu maka tampilkan kosong dulu
            //  *  dan selain itu juga tampilkan kosong lagi
            //  *  kemudian kembalikan dalam bentuk column karena akan di bentuk column ke bawah
            //  * childrenya di isi dengan foods kemudian di map parameter e => foodlistitem dengan food e dan itemwidhnya adalah lisItemWidht
            //  * jangan lupa di beri jarak ltrb maka ltrb di bungkus dengan pading dengan jarang kiri kanan degfault margin, atas nol dan bawah 16

            SizedBox(
              height: 80,
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        Column(
          children: [
            header(),
            cardOfFood(),
            tabBar(),
          ],
        ),
      ],
    );
  }
}
