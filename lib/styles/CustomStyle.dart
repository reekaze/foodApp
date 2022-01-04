import 'package:flutter/material.dart';

class CustomStyle {
  static const Loading =
      TextStyle(fontSize: 28, letterSpacing: 3, color: CustomStyle.fullRed);
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
  static const bold14black = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: CustomStyle.foregroundColor);
  static const grey14 = TextStyle(fontSize: 14, color: CustomStyle.grey);
  static const grey16 = TextStyle(fontSize: 16, color: CustomStyle.grey);
  static const boxShadow = BoxShadow(color: Colors.red, spreadRadius: 10);
  static const black20bold = TextStyle(
      fontSize: 20,
      color: CustomStyle.foregroundColor,
      fontWeight: FontWeight.bold);
  static const black20 = TextStyle(
    fontSize: 20,
    color: CustomStyle.foregroundColor,
  );
  static const white20 = TextStyle(
    fontSize: 20,
    color: CustomStyle.backgroundColor,
  );
  static const black24bold = TextStyle(
      fontSize: 24,
      color: CustomStyle.foregroundColor,
      fontWeight: FontWeight.bold);

  static const fullRed = Color(0xFFC8161D);
  static const backgroundColor = Color(0XFFFFFFFF);
  static const foregroundColor = Color(0XFF000000);
  static const brown = Color(0XFF910203);
  static const grey = Color(0xFF667C8A);
  static const red = Color(0XFFC8161D);
}
