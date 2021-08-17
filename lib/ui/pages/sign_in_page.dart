part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget inputEmail() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Email Adress',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Type your email address',
              ),
            ),
          ),
        ],
      );
    }

    Widget inputPassword() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Password',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Type your password',
              ),
            ),
          ),
        ],
      );
    }

    Widget signInButton() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: isLoading
            ? loadingIndicator
            : RaisedButton(
                onPressed: () {
                  Get.to(MainPage());
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: mainColor,
                child: Text(
                  'Sign In',
                  style: blackFontStyle3.copyWith(color: Colors.white),
                ),
              ),
      );
    }

    Widget createAccountButton() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: isLoading
            ? SpinKitCircle(
                size: 45,
                color: greyColor,
              )
            : RaisedButton(
                onPressed: () {
                  Get.to(SignUpPage());
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: greyColor,
                child: Text('Create New Account',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ),
      );
    }

    return GeneralPage(
      title: 'Sign In',
      subtitle: 'Find your best ever meal',
      child: Column(
        children: [
          inputEmail(),
          inputPassword(),
          signInButton(),
          createAccountButton(),
        ],
      ),
    );
  }
}
