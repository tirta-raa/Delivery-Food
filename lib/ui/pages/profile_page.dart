part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              height: 220,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    margin: EdgeInsets.only(bottom: 16),
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
                  ),
                  Text(
                    'Iron Man',
                    style: blackFontStyle2,
                  ),
                  Text(
                    'iron@gmail.com',
                    style: blackFontStyle2,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ['Account', 'Food Market'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: ((selectedIndex == 0)
                            ? [
                                'Edit Profile',
                                'Home Address',
                                'Security',
                                'Payment'
                              ]
                            : [
                                'Rate App',
                                'Help Center',
                                'Privacy & Policy',
                                'Term & Condition'
                              ])
                        .map(
                          (e) => Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e,
                                  style: blackFontStyle3,
                                ),
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    'assets/right_arrow.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ],
    );
  }
}
