part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //* kode ini di tambahkan ketika sudah menyelesaikan user cubit yang di tambah api
  //* Filr pictureFile itu berasak dari dart.io agar bisa mengambil foto dari galeri
  User user;
  File pictureFile;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //*kode ini digunakan untuk testing foto proifle statiw

    // Widget profilePicture() {
    //   return Container(
    //     width: 110,
    //     height: 110,
    //     margin: EdgeInsets.only(top: 26),
    //     padding: EdgeInsets.all(10),
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('assets/photo_border.png'),
    //       ),
    //     ),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         image: DecorationImage(
    //           image: AssetImage(
    //             'assets/iron.jpeg',
    //           ),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //   );
    // }

    //* kode ini digunakan ketika akan mengupload foto dari galeri

    Widget profilePicture() {
      return GestureDetector(
        //* ketika di tap maka akan menuju foto yang berada di galeri
        onTap: () async {
          PickedFile pickedFile =
              await ImagePicker().getImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            pictureFile = File(pickedFile.path);
            setState(() {});
          }
        },
        child: Container(
          width: 110,
          height: 110,
          margin: EdgeInsets.only(top: 26),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/photo_border.png'),
            ),
          ),
          //* jika ga upload foto maka tampilkan foto default kalau upload ganti foto yang di
          child: (pictureFile != null)
              ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: FileImage(
                        pictureFile,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/photo.png',
                      ),
                      fit: BoxFit.cover,
                    ),
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

    //* kode ini digunakan ketika masih dummy

    // Widget continueButton() {
    //   return Container(
    //     width: double.infinity,
    //     height: 45,
    //     margin: EdgeInsets.only(top: defaultMargin),
    //     padding: EdgeInsets.symmetric(horizontal: defaultMargin),
    //     child: RaisedButton(
    //       onPressed: () {
    //         Get.to(AdressPage());
    //       },
    //       elevation: 0,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       color: mainColor,
    //       child: Text(
    //         'Continue',
    //         style: blackFontStyle3,
    //       ),
    //     ),
    //   );
    // }

    //* kode ini digunakan ketika sudah di sambungkan ke api jadi ketika sign up
    //* membawa nama, email, password, dan pictuefile ke addresspage
    //* kode di bawah akan error jika belum memasukan final User user, karena adai di adresspage

    Widget continueButton() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: RaisedButton(
          onPressed: () {
            Get.to(AdressPage(
              User(
                name: nameController.text,
                email: emailController.text,
              ),
              passwordController.text,
              pictureFile,
            ));
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
