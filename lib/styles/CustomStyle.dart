import 'package:flutter/material.dart';

class CustomStyle {
  static const Loading = TextStyle(
      fontSize: 28,
      letterSpacing: 3,
      fontFamily: 'Poppins',
      color: CustomStyle.fullRed);
  static const city = TextStyle(
      fontSize: 16,
      color: CustomStyle.foregroundColor,
      fontWeight: FontWeight.bold);
  static const country = TextStyle(
      fontSize: 16, color: CustomStyle.grey, fontWeight: FontWeight.bold);
  static const heyText = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: CustomStyle.foregroundColor);
  static const letsget = TextStyle(
    fontSize: 16,
    color: CustomStyle.grey,
  );
  static const bold18 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  static const fullRed = Color(0xFFC8161D);
  static const backgroundColor = Color(0XFFFFFFFF);
  static const foregroundColor = Color(0XFF000000);
  static const brown = Color(0XFF910203);
  static const grey = Color(0xFF667C8A);
  static const red = Color(0XFFC8161D);
}
