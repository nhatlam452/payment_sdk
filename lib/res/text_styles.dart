import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colours.dart';

class AppTextStyle {
  AppTextStyle._();

  static final TextStyle _sans = GoogleFonts.notoSans();
  static TextStyle header = _sans.copyWith(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 18.sp,
  );
  static TextStyle regular = _sans.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColors.grey7,
    fontSize: 16.sp,
  );
  static TextStyle boldHeader = _sans.copyWith(
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 24.sp,
  );

  //====== Button ===
  static TextStyle primaryButton = _sans.copyWith(
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontSize: 18.sp,
  );

  //====== Term =====
  static TextStyle termHeader = boldHeader;

  //====== On board =====
  static TextStyle onBoardHeader = _sans.copyWith(
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 32.sp,
  );
  static TextStyle onBoardContent = regular;

  // ==== Bottom  bar ===
  static TextStyle bottomBar = regular.copyWith(fontSize: 12.sp);

  // ======= Home =======
  static TextStyle homeGreeting = header.copyWith(
    color: AppColors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle balanceLabel = regular.copyWith(
    fontSize: 14.sp,
  );
  static TextStyle amountHome = _sans.copyWith(
      fontSize: 40.sp, fontWeight: FontWeight.w300, color: AppColors.white);

  // ======= Buy Or Sell =====
  static TextStyle buyAndSellgreyText = _sans.copyWith(
    color: AppColors.grey11,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buyAndSellboldText = _sans.copyWith(
    color: AppColors.black2,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle phoneNumber = _sans.copyWith(
    color: AppColors.black2,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle userName = _sans.copyWith(
    color: AppColors.grey11,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle balanceWord = _sans.copyWith(
    color: AppColors.grey11,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle updatePrice = _sans.copyWith(
    color: AppColors.black2,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle moneyAmount = _sans.copyWith(
    color: AppColors.black2,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle buttonText = regular.copyWith(
    color: AppColors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle currencyWord = _sans.copyWith(
    color: AppColors.black2,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle currencyNumberAtVND = _sans.copyWith(
    color: AppColors.grey11,
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle currencyNumberNotAtVND = _sans.copyWith(
    color: AppColors.grey12,
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle shortenChainText = _sans.copyWith(
    color: AppColors.grey11,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  // ====== Setting =====
  static TextStyle settingLabel = boldHeader.copyWith(
      fontSize: 16.sp, color: AppColors.grey7, fontWeight: FontWeight.w600);
}
