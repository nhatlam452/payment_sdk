import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/payment/payment_screen.dart';

void executePayment(BuildContext context, String chainAmount, String amount,
    String chain, String accountId, VoidCallback callback) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
      context: context,
      chain: chain,
      chainAmount: chainAmount,
      accountId: accountId,
      amount: amount,
      callback: callback));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required this.context,
      required this.chainAmount,
      required this.amount,
      required this.chain,
      required this.accountId,
      required this.callback});

  final BuildContext context;
  final String chainAmount;
  final String amount;
  final String chain;
  final String accountId;
  final VoidCallback callback;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            home: PaymentScreen(
              amountVND: amount,
              amountChain: chainAmount,
              chain: chain,
              accountId: accountId,
              callback: callback,
            )));
  }
}
