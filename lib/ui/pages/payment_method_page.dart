part of 'pages.dart';

class PaymentMethodage extends StatelessWidget {
  final String paymentUrl;

  const PaymentMethodage(this.paymentUrl, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IlustrationPage(
          title: 'Finish Your Payment',
          subtitle: 'Please selecet your favorite \npayment method',
          picturePath: 'assets/Payment.png',
          buttonTitle1: 'Payment Method',
          buttonTap1: () async {
            //? launch itu dari package url_launcher
            //? payment Url ini di pasang di payment page line 507
            await launch(paymentUrl);
          },
          buttonTitle2: 'Continue ',
          buttonTap2: () {
            Get.to(const SuccessOrderPage());
          }),
    );
  }
}
