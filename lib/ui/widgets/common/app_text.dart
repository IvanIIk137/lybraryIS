import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/ui/style.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool center;
  final int? maxLines;
  final double? letterSpacing;
  final double? textHeight;

  const AppText(this.text,
      {super.key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.center = false,
      this.maxLines,
      this.letterSpacing,
      this.textHeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      maxLines: maxLines ?? 10000,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? AppColors.white,
          fontFamily: AppFontFamily.primary,
          letterSpacing: letterSpacing,
          height: textHeight),
    );
  }
}
