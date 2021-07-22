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
                  image: AssetImage('assets/iron.jpeg'),
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
                String body = (selectedIndex == 0)
                    ? 'New Taste Body'
                    : (selectedIndex == 1)
                        ? 'Popular Body'
                        : 'Recomended Body';
                return Center(
                  child: Text(
                    body,
                    style: blackFontStyle2,
                  ),
                );
              },
              // * di buat builder dengan nama parameter body mengandung string
              // * jika selected index sama dengan 0 maka tampilkna new taste body
              // * selain itu jika yang dipilih selected index sama dengan 1 maka tampilkan popular bidy
              // *  selain itu tampilkan recomeded body
              // * bilangan 0 da` saty ity di ambil dari gestur detector ontap yang ada di custtom tabbar
            ),
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
