part of 'pages.dart';

class AdressPage extends StatefulWidget {
  //* kode di bawah di gunakan ketika sign_up_page sudah selesai di koneksikan dengan api

  final User user;
  final String password;
  final File pictureFile;

  AdressPage(this.user, this.password, this.pictureFile);

  @override
  _AdressPageState createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  bool isLoading = false;

  //* untuk menambahkan kota
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();
    cities = ['Bandung', 'Jakarta', 'Sumedang'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    // City selectedCity;
    // List<City> city = [City('Leuwiliang'), City('Bogor'), City('Pabangbon')];

    // List<DropdownMenuItem> generateItems(List<City> city) {
    //   List<DropdownMenuItem> items = [];
    //   for (var item in city) {
    //     items.add(DropdownMenuItem(
    //       child: Text(item.cities),
    //       value: item,
    //     ));
    //     return items;
    //   }
    // }

    Widget inputPhoneNum() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Phone No',
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
              controller: phoneController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Type your phone number',
              ),
            ),
          ),
        ],
      );
    }

    Widget inputAddress() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Address',
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
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Type your address',
              ),
            ),
          ),
        ],
      );
    }

    Widget inputHouseNum() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'House No',
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
              controller: houseNumController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Type your house number',
              ),
            ),
          ),
        ],
      );
    }

    Widget inputCity() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'City',
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
            child: DropdownButton(
                value: selectedCity,
                isExpanded: true,
                underline: SizedBox(),
                onChanged: (item) {
                  setState(() {
                    selectedCity = item;
                  });
                },
                items: cities
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: blackFontStyle3,
                        )))
                    .toList()),
          ),
        ],
      );
    }

    // Widget signUpButton() {
    //   return Container(
    //     width: double.infinity,
    //     height: 45,
    //     margin: EdgeInsets.only(top: defaultMargin),
    //     padding: EdgeInsets.symmetric(horizontal: defaultMargin),
    //     child: RaisedButton(
    //       onPressed: () {
    //         Get.to(MainPage());
    //       },
    //       elevation: 0,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       color: mainColor,
    //       child: Text(
    //         'Sign Up',
    //         style: blackFontStyle3,
    //       ),
    //     ),
    //   );
    // }

    //* kode di bawah digunakan ketika menggunakan api

    Widget signUpButton() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: (isLoading == true)
            ? Center(child: loadingIndicator)
            : RaisedButton(
                onPressed: () async {
                  User user = widget.user.copyWith(
                    phoneNumber: phoneController.text,
                    address: addressController.text,
                    houseNumber: houseNumController.text,
                    city: selectedCity,
                  );

                  setState(() {
                    isLoading = true;
                  });

                  await context.bloc<UserCubit>().signUp(user, widget.password,
                      pictureFile: widget.pictureFile);
                  UserState state = context.bloc<UserCubit>().state;

                  if (state is UserLoaded) {
                    context.bloc<FoodCubit>().getFood();
                    context.bloc<TransactionCubit>().getTransactions();
                    Get.to(MainPage());

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
                      icon: Icon(
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
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: mainColor,
                child: Text(
                  'Sign Up',
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
          inputPhoneNum(),
          inputAddress(),
          inputHouseNum(),
          inputCity(),
          signUpButton(),
        ],
      ),
    );
  }
}
