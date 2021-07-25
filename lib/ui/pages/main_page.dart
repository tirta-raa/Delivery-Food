part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  // dibuat int selectedPage dengan awalan
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: 'FAFAFC'.toColor(),
            ),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              // * onpagechange minta sebuah fungsi(index) dengan parameter int dengan memasukan index page yang sedang di pilih
              //  *selected indexnya (selectedpage) = index;
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                    child: IlustrationPage(
                        title: 'Ouch Hungry',
                        subtitle: 'Seems you have not\nordered any food yet',
                        picturePath: 'assets/love_burger.png',
                        buttonTitle1: 'Find Foods',
                        buttonTap1: () {})),
                Center(
                  child: Text(
                    'Profile',
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              // * dipilih selectedpage karena di atas sudah di buat
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
              // *di ontap meminta int juga setstate sama dengan index kemudian pindahakam pagecontroler jumptopage selectedpage
            ),
          ),
        ],
      ),
    );
  }
}
