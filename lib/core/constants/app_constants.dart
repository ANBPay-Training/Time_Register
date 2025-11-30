import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color buttonGreenLight = Color(0xFFB2DFBB);
  static const Color buttonGreenDark = Color(0xFF81C784);
  static const Color buttonRedLight = Color(0xFFFFCDD2);
  static const Color buttonRedDark = Color(0xFFEF9A9A);
  static final Color buttonGreyLight = Colors.grey[200]!;
  static final Color buttonGreyDark = Colors.grey[300]!;

  // Sizes
  static const double buttonHeight = 70.0;
  static const double buttonBorderRadius = 18.0;
  static const double numButtonSize = 75.0;
  static const double numButtonBorderRadius = 14.0;
  static const double pinDialogWidth = 330.0;
  static const double pinDialogBorderRadius = 22.0;

  // Text Styles
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle numButtonTextStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle deleteButtonTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  // Shadow
  static const List<BoxShadow> buttonShadow = [
    BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
  ];

  // PIN
  static const int pinLength = 4;
  static const String wrongPinMessage = "Wrong PIN!";

  // Spacing
  static const double spacingSmall = 4.0;
  static const double spacingMedium = 8.0;
  static const double spacingLarge = 20.0;
  static const double spacingXLarge = 30.0;
}
