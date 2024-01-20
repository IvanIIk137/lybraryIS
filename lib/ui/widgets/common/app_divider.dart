import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/ui/style.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  final double? verticalPadding;
  final EdgeInsets? padding;
  final double? height;
  const AppDivider({super.key, this.color, this.verticalPadding, this.padding, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: verticalPadding ?? 8.sp,
          ),
      child: Divider(color: color ?? AppColors.greyLight, height: height ?? 1.sp),
    );
  }
}
