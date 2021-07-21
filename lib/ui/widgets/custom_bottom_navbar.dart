part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  // ketka membuat buttom navbar memberikan fungsi sebuah int ya itu index yang di atas
  CustomBottomNavbar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget homeButton() {
      return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap(0);
          }
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/ic_home' +
                      ((selectedIndex == 0) ? '.png' : '_normal.png'),
                ),
                fit: BoxFit.contain),
          ),
        ),
      );
    }

    Widget orderButton() {
      return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap(1);
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 83),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/ic_order' +
                      ((selectedIndex == 1) ? '.png' : '_normal.png'),
                ),
                fit: BoxFit.contain),
          ),
        ),
      );
    }

    Widget profileButton() {
      return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap(2);
          }
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/ic_profile' +
                      ((selectedIndex == 2) ? '.png' : '_normal.png'),
                ),
                fit: BoxFit.contain),
          ),
        ),
      );
    }

    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          homeButton(),
          orderButton(),
          profileButton(),
        ],
      ),
    );
  }
}
