part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Widget profilePicture() {
      return Container(
        width: 110,
        height: 110,
        margin: EdgeInsets.only(top: 26),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photo_border.png'),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/iron.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget inputName() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Full Name',
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
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Type your full name',
              ),
            ),
          ),
        ],
      );
    }

    Widget inputEmail() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
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

    Widget continueButton() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: RaisedButton(
          onPressed: () {
            Get.to(AdressPage());
          },
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: mainColor,
          child: Text(
            'Continue',
            style: blackFontStyle3,
          ),
        ),
      );
    }

    return GeneralPage(
      title: 'Sign Up',
      subtitle: 'Make sure all correct',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          profilePicture(),
          inputName(),
          inputEmail(),
          inputPassword(),
          continueButton(),
        ],
      ),
    );
  }
}
