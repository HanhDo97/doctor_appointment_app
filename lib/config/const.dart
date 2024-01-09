import 'package:flutter/material.dart';

class Const {
  static MediaQueryData? mediaQueryData;
  static double? mediaWidth;
  static double? mediaHeight;

  static init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    mediaHeight = mediaQueryData!.size.height;
    mediaWidth = mediaQueryData!.size.width;
  }

  static get screenWidth {
    return mediaWidth;
  }

  static get screenHeight {
    return mediaHeight;
  }

  static const spaceSmall = SizedBox(height: 25);
  static final spaceMedium = SizedBox(height: mediaHeight! * 0.04);
  static final spaceBig = SizedBox(height: mediaHeight! * 0.08);

  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.black38),
  );

  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.greenAccent));
  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red));

  static const primaryColor = Colors.greenAccent;
}
