part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  List<Transaction> inProgress = mockTranscation
      .where((element) =>
          element.status == TransactionStatus.on_delivery ||
          element.status == TransactionStatus.pending)
      .toList();

  List<Transaction> past = mockTranscation
      .where((element) =>
          element.status == TransactionStatus.delivered ||
          element.status == TransactionStatus.cancelled)
      .toList();

  @override
  Widget build(BuildContext context) {
    if (inProgress.length == 0 && past.length == 0) {
      return IlustrationPage(
          title: 'Ouch Hungry',
          subtitle: 'Seems you have not\nordered any food yet',
          picturePath: 'assets/love_burger.png',
          buttonTitle1: 'Find Foods',
          buttonTap1: () {});
    } else {
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
                titles: ['In Progress', 'Past Orders'],
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
                children: (selectedIndex == 0 ? inProgress : past)
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.fromLTRB(
                            defaultMargin, 0, defaultMargin, 16),
                        child: OrderListItem(
                            transaction: e, itemWidht: listItemWidht),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
