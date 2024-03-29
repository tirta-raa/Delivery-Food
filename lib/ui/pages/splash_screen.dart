part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(const SignInPage());
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/onboarding.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Center(
              child: Image.asset(
            'assets/lg.png',
            width: 321,
            height: 321,
          )),
        ],
      ),
    );
  }
}
