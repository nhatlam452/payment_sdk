import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../res/text_styles.dart';

String getFormattedTodayDate() {
  DateTime now = DateTime.now();
  DateFormat dateFormatter = DateFormat('d \'thg\' M, y \'lúc\' HH:mm');
  return dateFormatter.format(now);
}

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess(
      {super.key,
      required this.callback,
      required this.amountVND,
      required this.amountChain,
      required this.chain});

  final VoidCallback callback;
  final String amountVND;
  final String amountChain;
  final String chain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 120,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.ios_share,
                color: Color(0xFF404345),
              ),
            ),
            Expanded(
              child: MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                    callback();
                  },
                  child: Container(
                    height: 64,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(999)),
                    child: Center(
                        child: Text(
                      "Xác thực bằng mã mở khoá",
                      style: AppTextStyle.regular.copyWith(color: Colors.white),
                    )),
                  )),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(9999)),
                padding: EdgeInsets.all(8),
                child: Icon(
                  size: 40,
                  Icons.check,
                  color: Colors.white,
                )),
            SizedBox(
              height: 24,
            ),
            Image.asset(
              "assets/tech_banner.png",
              height: 30,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Thanh toán thành công VND ${amountVND}",
              style: AppTextStyle.boldHeader,
            ),
            SizedBox(
              height: 64,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nội dung",
                  style: AppTextStyle.regular,
                ),
                Text("Thanh toán mua ${amountChain} ${chain}",
                    style: AppTextStyle.regular.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: AppTextStyle.regular.fontSize! + 2)),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ngày thực hiện",
                  style: AppTextStyle.regular,
                ),
                Text(getFormattedTodayDate(),
                    style: AppTextStyle.regular.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: AppTextStyle.regular.fontSize! + 2)),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mã giao dịch",
                  style: AppTextStyle.regular,
                ),
                Text("FT24138807822210",
                    style: AppTextStyle.regular.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: AppTextStyle.regular.fontSize! + 2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
