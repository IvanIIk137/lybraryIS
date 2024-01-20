import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppFontFamily {
  static const String primary = 'Montserrat';
}

class AppColors {
  static Color white = const Color(0xffffffff);
  static Color primaryBlue = const Color(0xff5E8EF7);
  static Color blackBck = const Color(0xff16161B);
  static Color black = const Color(0xff22222A);
  static Color grey = const Color(0xff24242C);
  static Color greyLight = const Color(0xff737389);
  static Color green = const Color(0xff339B62);
  static Color red = const Color(0xffE76056);
  static Color gold = const Color(0xFFF3CE7B);
  static Color violet = const Color(0xFFAC6CDB);
}

class Space {
  static double bottomBarHeight = bottomSafeArea + 48.sp;
  static double headerBarHeight = 112.sp;
  static double searchHeaderHeight = Space.topSafeArea + 14.sp + 16.sp + 40.sp;
  static double bottomSafeArea =
      Get.context?.mediaQueryPadding.bottom != null && Get.context?.mediaQueryPadding.bottom != 0
          ? Get.context!.mediaQueryPadding.bottom
          : 16.sp;
  static double topSafeArea = Get.context?.mediaQueryPadding.top != null && Get.context?.mediaQueryPadding.top != 0
      ? Get.context!.mediaQueryPadding.top
      : 16.sp;
}

class TextFieldHeight {
  static double heightLines13 = Platform.isIOS ? 251.sp : 260.sp;
}

class StatusBarStyle {
  static SystemUiOverlayStyle dark = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  static SystemUiOverlayStyle light = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}

class AppDuration {
  static const Duration d80 = Duration(milliseconds: 80);
  static const Duration d100 = Duration(milliseconds: 100);
  static const Duration d150 = Duration(milliseconds: 150);
  static const Duration d200 = Duration(milliseconds: 200);
  static const Duration d300 = Duration(milliseconds: 400);
  static const Duration d400 = Duration(milliseconds: 400);
}
