part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  // *ini buat index yang terpilih

  final List<String> titles;
  // * ini untuk judul

  final Function(int) onTap;
  // * fungsi untuk menerina int parameter yang akan index yang dipilih lewat paremter ini

  CustomTabBar({this.selectedIndex, @required this.titles, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: 'F2F2F2'.toColor(),
          ),
          Row(
            children: titles
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(left: defaultMargin),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) {
                              onTap(titles.indexOf(e));
                            }
                          },
                          child: Text(
                            e,
                            style: (titles.indexOf(e) == selectedIndex)
                                ? blackFontStyle3.copyWith(
                                    fontWeight: FontWeight.w500)
                                : blackFontStyle3,
                          ),
                        ),
                        // * arti kode di atas adalah di masukan List<String> titles
                        // * kemudian di map dengan jarak kiri default margin
                        // * di buat column dengan isi gesturdectector
                        // * kemudian onTap ( ){ jika (ontap sama dengan null)} maka munculkan judul dari yang di pilih (e)
                        // * kemudian text judulnya text e di pilih e karena di indexofnya di pilih e alias judul yang di pilih
                        // *  style (judul. index yang di pilih [index.of(e)] sama dengan selected index selected index ini nanti kepake di food page karena harus di tetapkan nilainya nanti) maka tampilkan blackfonstyl
                        // *  selain itu blackFontStyle3
                        Container(
                          width: 50,
                          height: 3,
                          margin: EdgeInsets.only(top: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.5),
                            color: (titles.indexOf(e) == selectedIndex)
                                ? '020202'.toColor()
                                : Colors.transparent,
                          ),
                        ),
                        // * ini garis yang ada di bawah judul yang di pilih jika judul di pilih sama dengan selected index maka munculkan warna hitam selain itu transparan
                      ],
                    ),
                  ),
                )
                .toList(),
            // * jangan lupa nasukin tolist karena ini tipe list
          ),
        ],
      ),
    );
  }
}
