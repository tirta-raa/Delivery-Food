// ignore_for_file: deprecated_member_use

part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

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
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Email Adress',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Password',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
        margin: const EdgeInsets.only(top: defaultMargin),
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: isLoading
            ? loadingIndicator
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  await context
                      .bloc<UserCubit>()
                      .signIn(emailController.text, passwordController.text);
                  UserState state = context.bloc<UserCubit>().state;

                  if (state is UserLoaded) {
                    context.bloc<FoodCubit>().getFood();
                    context.bloc<TransactionCubit>().getTransactions();
                    Get.to(const MainPage());

                    // * arti kode di atas adalah tunggu context dari bloc usercubit kemudian panggil fungsi sigIn k=yang di dalamnya di isi email controler dan text controler
                    // * kemudian userstate di simoan dalam state sama dengan context dari bloc of usercubit di state
                    // * kemudian di cek kondisinya jika if state  is adalah userloaded maka tampilkan
                    // * context yang ada dibloc of food cubit dan fungsi getFood
                    // * context yang ada dibloc of transaction cubit dan fungsi getTransactions
                    // * kemudian pergi ke page main

                  } else {
                    Get.snackbar(
                      '',
                      '',
                      backgroundColor: 'D9435E'.toColor(),
                      icon: const Icon(
                        MdiIcons.closeCircleOutline,
                        color: Colors.white,
                      ),
                      titleText: Text(
                        'Sign In Failed',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      messageText: Text(
                        (state as UserLoadingFailed).message,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    );
                    setState(() {
                      isLoading = false;
                    });
                  }

                  // *  arti kode di atas adalah untuk mengecek apakah state yang ada dalam usercubit adalah userloadingfailed
                  // *   get snacbar adalah pop up yang muncul dari bawaan paket get
                  // *   di berikan kutip dua karena akan di isi oleh pesasn yang ada di cubit
                  // * kasih warna merah dengan icon silang dengan judul pesan sign in failed
                  // *  mesage textnya di isi dengan state saat ini yaitu userloading failed dengan message yang ada di api return value
                  // *  kemudian sestate di bbuat false agar bisa di klik kembali tombolnya
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: mainColor,
                ),
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
        margin: const EdgeInsets.only(top: defaultMargin),
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: isLoading
            ? SpinKitCircle(
                size: 45,
                color: greyColor,
              )
            : ElevatedButton(
                onPressed: () {
                  Get.to(const SignUpPage());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: greyColor,
                ),
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
