part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

// * untuk pengetesan sebelum di pasang bloc transaction statusnya du buat di atas dulu
  // /   List<Transaction> inProgress = mockTranscation
//       .where((element) =>
//           element.status == TransactionStatus.on_delivery ||
//           element.status == TransactionStatus.pending)
//       .toList();

//   List<Transaction> past = mockTranscation
//       .where((element) =>
//           element.status == TransactionStatus.delivered ||
//           element.status == TransactionStatus.cancelled)
//       .toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      // ignore: missing_return
      builder: (_, state) {
        // * if jika state itu transaction loaded maka tampilkan isi konten selain itu tampilkan loading indikator
        if (state is TransactionLoaded) {
          // * if jika state transaction tida ada isinya alias belum memesan apapu tampilkan ilustrasi di bawah
          if (state.transaction.isEmpty) {
            return IlustrationPage(
                title: 'Ouch Hungry',
                subtitle: 'Seems you have not\nordered any food yet',
                picturePath: 'assets/love_burger.png',
                buttonTitle1: 'Find Foods',
                buttonTap1: () {});
          } else {
            // *  selain itu munculkan layar transaksi
            double listItemWidht =
                MediaQuery.of(context).size.width - 2 * defaultMargin;
            return GeneralPage(
              title: 'Order History',
              subtitle: 'Your order history',
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(
                      titles: const ['In Progress', 'Past Orders'],
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
                    Builder(builder: (_) {
                      List<Transaction> transaction = (selectedIndex == 0)
                          ? state.transaction
                              .where((element) =>
                                  element.status ==
                                      TransactionStatus.on_delivery ||
                                  element.status == TransactionStatus.pending)
                              .toList()
                          : state.transaction
                              .where((element) =>
                                  element.status ==
                                      TransactionStatus.delivered ||
                                  element.status == TransactionStatus.cancelled)
                              .toList();
                      // *  arti kode di atas dibuat list of transaction yang disimpan di transaction
                      // * kalau selectedIndex sama dengan 0 maka tampilkan state
                      // * if jika state transaction  note :" ondeliver dan pendding itu di kerjakan saat ini"
                      // * dimana disimpan dengan nama element mengembalikan element dengan status ondelivert atau pending
                      // * selain itu tampilkan note 'delivered dan canceled adalah masa lampau karena sudah di kerjakan alias sudah di kirim atau di batalkan oleh penerima'
                      // * transaksi saat ini dimana di simpan dengan nama 'element' akan mengembalikan elemet dengan status delivered atau canceled
                      return Column(
                        children: transaction
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 16),
                                child: GestureDetector(
                                  //? jadi ketika di hisoty masih pending maka kita bisa klik untuk membayar
                                  onTap: () async {
                                    if (e.status == TransactionStatus.pending) {
                                      await launch(e.paymentUrl);
                                    }
                                  },
                                  child: OrderListItem(
                                      transaction: e, itemWidht: listItemWidht),
                                ),
                              ),
                            )
                            .toList(),
                        // * arti kode di atas adalah ketikaj builder sudah selesai menentukan status transaksi makan kembalikan
                        // * transaction dengan map disimoan dengan nama 'e' mengembaalikan orderlistitem dengan nama transation 'e' dan itemwidht sesuai dengan list item widht'
                      );
                    }),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          Center(
            child: loadingIndicator,
          );
        }
      },
    );
  }
}

// * kode di bawah di gunakanketika belum menggunakan bloc

// part of 'pages.dart';

// class OrderHistoryPage extends StatefulWidget {
//   @override
//   _OrderHistoryPageState createState() => _OrderHistoryPageState();
// }

// class _OrderHistoryPageState extends State<OrderHistoryPage> {
//   int selectedIndex = 0;

//   List<Transaction> inProgress = mockTranscation
//       .where((element) =>
//           element.status == TransactionStatus.on_delivery ||
//           element.status == TransactionStatus.pending)
//       .toList();

//   List<Transaction> past = mockTranscation
//       .where((element) =>
//           element.status == TransactionStatus.delivered ||
//           element.status == TransactionStatus.cancelled)
//       .toList();

//   @override
//   Widget build(BuildContext context) {
//     if (inProgress.length == 0 && past.length == 0) {
//       return IlustrationPage(
//           title: 'Ouch Hungry',
//           subtitle: 'Seems you have not\nordered any food yet',
//           picturePath: 'assets/love_burger.png',
//           buttonTitle1: 'Find Foods',
//           buttonTap1: () {});
//     } else {
//       double listItemWidht =
//           MediaQuery.of(context).size.width - 2 * defaultMargin;
//       return GeneralPage(
//         title: 'Order History',
//         subtitle: 'Your order history',
//         child: Container(
//           width: double.infinity,
//           color: Colors.white,
//           child: Column(
//             children: [
//               CustomTabBar(
//                 titles: ['In Progress', 'Past Orders'],
//                 selectedIndex: selectedIndex,
//                 onTap: (index) {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Column(
//                 children: (selectedIndex == 0 ? inProgress : past)
//                     .map(
//                       (e) => Padding(
//                         padding: EdgeInsets.fromLTRB(
//                             defaultMargin, 0, defaultMargin, 16),
//                         child: OrderListItem(
//                             transaction: e, itemWidht: listItemWidht),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }
