part of 'pages.dart';

class AdressPage extends StatefulWidget {
  @override
  _AdressPageState createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController houseNumController = TextEditingController();

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
            child: TextDropdownFormField(
              options: ['Bogor', 'Jakrta', 'Leuwiliang'],
              decoration: InputDecoration(
                hintText: 'Chose your cities',
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              dropdownHeight: 200,
            ),
          ),
        ],
      );
    }

    Widget signUpButton() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: RaisedButton(
          onPressed: () {
            Get.to(MainPage());
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
