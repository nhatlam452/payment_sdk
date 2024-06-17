import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to ensure that instances of this class can only
  // be created at compile-time and are considered constants.
  const AppColors._();

  static const primaryGradient = [leftPrimaryGradient, rightPrimaryGradient];
  static const Color purple200 = Color(0xFFBB86FC);
  static const Color purple500 = Color(0xFF6200EE);
  static const Color purple700 = Color(0xFF3700B3);
  static const Color teal200 = Color(0xFF03DAC5);
  static const Color teal700 = Color(0xFF018786);
  static const Color black = Color(0xFF000000);
  static const Color black2 = Color(0xFF212325);

  static const Color white = Color(0xFFFFFFFF);

  static const Color primary = Color(0xFF017CFF);
  static const Color primaryLight = Color(0xFF3964FF);
  static const Color leftPrimaryGradient = Color(0xFF5675FF);
  static const Color rightPrimaryGradient = Color(0xFF90ECFE);
  static const Color blueStatusBar = Color(0xFF1787C7);
  static const Color solidBlue = Color(0xFF00569F);
  static const Color defaultRippleColor = Color(0xFF3314021F);
  static const Color transparent = Color(0x00000000);
  static const Color secondaryBlue = Color(0xFF322FFF);
  static const Color blue = Color(0xFF017CFF);
  static const Color blue121C36 = Color(0xFF121C36);
  static const Color secondaryRippleColor = Color(0xFF3314021F);
  static const Color yellow = Color(0xFFFFE484);
  // ============ setting ==========
  static const Color settingItemsBackground = const Color(0xFFF7F8F9);

  // Grey
  static const Color grey12 = const Color(0xFF616162);
  static const Color grey11 = const Color(0xFF9FA1A4);
  static const Color grey10 = Color(0xFF000000);
  static const Color grey9 = Color(0xFF262626);
  static const Color grey8 = Color(0xFF595959);
  static const Color grey7 = Color(0xFF8C8C8C);
  static const Color grey6 = Color(0xFFBFBFBF);
  static const Color grey5 = Color(0xFFD9D9D9);
  static const Color grey4 = Color(0xFFE8E8E8);
  static const Color grey3 = Color(0xFFF5F5F5);
  static const Color grey2 = Color(0xFFFAFAFA);
  static const Color grey1 = white; // FFFFFFFF
  static const Color lightGrey = Color(0xFFF7F8F9); // FFFFFFFF
  static const Color lightGreyDarker = Color(0xFFD7D7D7); // FFFFFFFF
  static const Color iconGrey = Color(0xFF9495A2); // FFFFFFFF
  static const Color grey = Color(0xFF9FA1A4);
  static const Color darkGrey = Color(0xFF707073);
  static const Color outlineColor = Color(0xFFE2E4E8);
  static const Color black1 = Color(0xFF313131);
  static const Color sideLogo = Color(0xFFE1E8F4);

  static const Color blackColor = Color(0xFFF2F4F5);

  // Red
  static const Color red6 = Color(0xFFF5222D);
  static const Color red = Color(0xFFF83356);
  static const Color redFF3458 = Color(0xFFFF3458);

  // Green
  static const Color green6 = Color(0xFF2EB553);
  static const Color green00B93F = Color(0xFF00B93F);

  // Blue
  static const Color blue6 = Color(0xFF1890FF);

  // Pink
  static const Color pink = Color(0xFFE665B0);
  static const Color secondaryPink = Color(0xFF90ECFE);

  // Orange
  static const Color orange6 = Color(0xFFFA8C16);
  static const Color orange7 = Color(0xFFF38121);
  //===== Button ===
  static const Color primaryButtonColor = black;
  static const Color disablePrimaryButtonColor = grey;
}
