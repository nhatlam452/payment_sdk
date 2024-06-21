import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:payment/string_ext.dart';
import 'package:payment/toast_helper.dart';

import '../res/text_styles.dart';
import 'payment_success.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
    required this.amountVND,
    required this.amountChain,
    required this.chain,
    required this.accountId,
    required this.callback,
  }) : super(key: key);

  final String amountVND;
  final String amountChain;
  final String chain;
  final String accountId;
  final VoidCallback callback;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool showLoading = true;
  String userName = "";
  String balance = "";

  @override
  void initState() {
    super.initState();
    fetchAccountInfo();
  }

  Future<void> fetchAccountInfo() async {
    final url =
        'https://tram-connect-wallet.vertiree.com/api/bank-mockup/account/${widget.accountId}';
    print("get acc ${url}");
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          balance = data['balance'].toString();
          userName = data['username'];
          showLoading = false;
        });
      } else {
        setState(() {
          showLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load account info')),
        );
      }
    } catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return showLoading
        ? const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()))
        : Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: Container(
              height: 128,
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (aContext) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          height: 850.h,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(Icons.close),
                                ),
                                SizedBox(height: 60),
                                Image.asset(
                                  "assets/logo_tech.png",
                                  fit: BoxFit.contain,
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Nhập mã mở khoá để xác thực",
                                  style: AppTextStyle.boldHeader,
                                ),
                                SizedBox(height: 40),
                                OtpTextField(
                                  autoFocus: true,
                                  alignment: Alignment.centerLeft,
                                  styles: List.generate(
                                    6,
                                    (index) => AppTextStyle.header,
                                  ),
                                  numberOfFields: 6,
                                  borderColor: Colors.blue,
                                  focusedBorderColor: Colors.blue,
                                  showFieldAsBox: false,
                                  borderWidth: 4.0,
                                  onCodeChanged: (String code) {},
                                  onSubmit: (String verificationCode) async {
                                    Navigator.pop(context);
                                    setState(() {
                                      showLoading = true;
                                    });

                                    const url =
                                        'https://tram-connect-wallet.vertiree.com/api/bank-mockup/account/transfer';
                                    const headers = {
                                      'Content-Type': 'application/json'
                                    };
                                    var body = jsonEncode({
                                      "fromAccountId": widget.accountId,
                                      "toAccountNo": "4083827099",
                                      "amount": widget.amountVND,
                                      "pinCode": verificationCode,
                                    });
                                    print("body ${jsonDecode(body)}");
                                    try {
                                      await http
                                          .post(
                                        Uri.parse(url),
                                        headers: headers,
                                        body: body,
                                      )
                                          .then((response) {
                                        if (response.statusCode == 200) {
                                          setState(() {
                                            showLoading = false;
                                          });
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentSuccess(
                                                callback: widget.callback,
                                                amountVND: widget.amountVND,
                                                amountChain: widget.amountChain,
                                                chain: widget.chain,
                                              ),
                                            ),
                                          );
                                        } else {
                                          setState(() {
                                            showLoading = false;
                                          });
                                          $toastHelper.toastIt(context: context
                                          ,title: "Giao dịch thát "
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(jsonDecode(
                                                    response.body)["message"]
                                                ["details"][0]["issue"]),
                                          ));
                                        };
                                      });
                                    } catch (e) {
                                      setState(() {
                                        showLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text("$e")),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 64,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Center(
                      child: Text(
                        "Xác thực bằng mã mở khoá",
                        style:
                            AppTextStyle.regular.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "Bạn đang thanh toán VND ${widget.amountVND.formatBalance()}",
                    style: AppTextStyle.boldHeader,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFD7D7D7),
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Thanh toan mua ${widget.amountChain} ${widget.chain}",
                            style: AppTextStyle.regular,
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 132,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Color(0xFFD7D7D7),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.wallet),
                                  title: Text(
                                    "Tài khoản thanh toán",
                                    style: AppTextStyle.header,
                                  ),
                                  subtitle: Text(
                                    userName,
                                    style: AppTextStyle.regular,
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "VND ${balance.formatBalance()}",
                                    style: AppTextStyle.regular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
