import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../res/text_styles.dart';

final $toastHelper = ToastHelper();

class ToastHelper {
  void toastIt({
    AlignmentGeometry alignment = Alignment.center,
    String title = '',
    required BuildContext context,
    String description = '',
    int duration = 5,
    ToastificationType type = ToastificationType.warning,
  }) {
    // if (title.trim().isEmpty) {
    //   title = t.notification.not_available_header;
    // }

    // if (description.trim().isEmpty) {
    //   title = t.notification.not_available_content;
    // }
    toastification.show(
      context: context,
      title: Text(
        title,
        style: AppTextStyle.header,
      ),
      autoCloseDuration: Duration(seconds: duration),
      type: type,
      style: ToastificationStyle.flat,
      alignment: alignment,
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.always,
      dragToClose: true,
      borderRadius: BorderRadius.circular(12),
      closeOnClick: true,
      description: Text(
        description,
        style: AppTextStyle.regular,
      ),
    );
  }

  // void toastErrorBuying({
  //   String title = 'There is an error occur when buying.',
  //   required BuildContext context,
  //   String description = 'This might caused by large amount of money.',
  //   int duration = 9,
  //   ToastificationType type = ToastificationType.error,
  // }) {
  //   toastification.show(
  //     context: context,
  //     title: Text(
  //       title,
  //       style: AppTextStyle.buyAndSellboldText,
  //     ),
  //     autoCloseDuration: Duration(seconds: duration),
  //     type: type,
  //     style: ToastificationStyle.flat,
  //     alignment: Alignment.center,
  //     showProgressBar: true,
  //     closeButtonShowType: CloseButtonShowType.always,
  //     dragToClose: true,
  //     borderRadius: BorderRadius.circular(12.r),
  //     closeOnClick: true,
  //     description: Text(
  //       description,
  //       style: AppTextStyle.regular.copyWith(fontSize: 14.sp),
  //     ),
  //   );
  // }

  // void toastErrorFormating({
  //   String title = 'Please input correct format number.',
  //   required BuildContext context,
  //   String description = 'This might caused by . or , .',
  //   int duration = 3,
  //   ToastificationType type = ToastificationType.error,
  // }) {
  //   toastification.show(
  //     context: context,
  //     title: Text(
  //       title,
  //       style: AppTextStyle.buyAndSellboldText,
  //     ),
  //     autoCloseDuration: Duration(seconds: duration),
  //     type: type,
  //     style: ToastificationStyle.flat,
  //     alignment: Alignment.topCenter,
  //     showProgressBar: true,
  //     closeButtonShowType: CloseButtonShowType.always,
  //     dragToClose: true,
  //     borderRadius: BorderRadius.circular(12.r),
  //     closeOnClick: true,
  //     description: Text(
  //       description,
  //       style: AppTextStyle.regular.copyWith(fontSize: 14.sp),
  //     ),
  //   );
  // }

  void toastNotAvalible({
    String title = 'Features not available yet.',
    required BuildContext context,
    String description = 'Please try again later.',
    int duration = 2,
    ToastificationType type = ToastificationType.warning,
  }) {
    toastification.show(
      context: context,
      title: Text(
        title,
        style: AppTextStyle.buyAndSellboldText,
      ),
      autoCloseDuration: Duration(seconds: duration),
      type: type,
      style: ToastificationStyle.flat,
      alignment: Alignment.center,
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.always,
      dragToClose: true,
      borderRadius: BorderRadius.circular(12.r),
      closeOnClick: true,
      description: Text(
        description,
        style: AppTextStyle.regular.copyWith(fontSize: 14.sp),
      ),
    );
  }

  void toastBankNotAvailable({
    String title = 'Bank not available.',
    required BuildContext context,
    String description = 'Please try again later.',
    int duration = 2,
    ToastificationType type = ToastificationType.warning,
  }) {
    toastification.show(
      context: context,
      title: Text(
        title,
        style: AppTextStyle.buyAndSellboldText,
      ),
      autoCloseDuration: Duration(seconds: duration),
      type: type,
      style: ToastificationStyle.flat,
      alignment: Alignment.center,
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.always,
      dragToClose: true,
      borderRadius: BorderRadius.circular(12.r),
      closeOnClick: true,
      description: Text(
        description,
        style: AppTextStyle.regular.copyWith(fontSize: 14.sp),
      ),
    );
  }

}
