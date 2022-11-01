part of 'pages.dart';

class SuccessSingUpPage extends StatelessWidget {
  const SuccessSingUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IlustrationPage(
        title: 'Yeay! Completed',
        subtitle: 'Now you are able to order \nsome foods as self-reward',
        picturePath: 'assets/food_wishes.png',
        buttonTitle1: 'Find Foods',
        buttonTap1: () {},
      ),
    );
  }
}
