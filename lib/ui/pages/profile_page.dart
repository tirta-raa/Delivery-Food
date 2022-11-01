// ignore_for_file: deprecated_member_use

part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget profileImage() {
      return Container(
        width: 110,
        height: 110,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photo_border.png'),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                (context.bloc<UserCubit>().state as UserLoaded)
                    .user
                    .picturePath,

                // * arti kode di atas adalah ambil gambar dari internet
                // * contect yang mengandung bloc of usercubit pada saat sekarang atau pada saat user berhasil loaded
                // * ambil data user dari user cubit
                // * munculkan foto yang di ambil dari picturePath dari models
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget userName() {
      return Text(
        (context.bloc<UserCubit>().state as UserLoaded).user.name,
        style: blackFontStyle2,

        // * arti kode di atas adalah ambil gambar dari internet
        // * contect yang mengandung bloc of usercubit pada saat sekarang atau pada saat user berhasil loaded
        // * ambil data user dari user cubit
        // * munculkan nama pengguna dari models
      );
    }

    Widget userEmail() {
      return Text(
        (context.bloc<UserCubit>().state as UserLoaded).user.email,
        style: blackFontStyle2,

        // * arti kode di atas adalah ambil gambar dari internet
        // * contect yang mengandung bloc of usercubit pada saat sekarang atau pada saat user berhasil loaded
        // * ambil data user dari user cubit
        // * munculkan email dari models
      );
    }

    Widget tabBar() {
      return Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            CustomTabBar(
              titles: const ['Account', 'Food Market'],
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: ((selectedIndex == 0)
                      ? ['Edit Profile', 'Home Address', 'Security', 'Payment']
                      : [
                          'Rate App',
                          'Help Center',
                          'Privacy & Policy',
                          'Term & Condition'
                        ])
                  .map(
                    (e) => Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
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
      );
    }

    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: defaultMargin),
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              height: 220,
              color: Colors.white,
              child: Column(
                children: [
                  profileImage(),
                  userName(),
                  userEmail(),
                ],
              ),
            ),
            tabBar(),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ],
    );
  }
}
