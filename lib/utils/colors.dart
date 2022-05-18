import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color blue = Color(0xffD3F4FE);
  static const Color deepBlue = Color(0xff008AA7);
  static const Color orange = Color(0xffEBD75C);
  static const LinearGradient mainGradient = LinearGradient(
    colors: [
      blue,
      Color(0xffffffff),
    ],
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.7, 1.0),
  );
}
