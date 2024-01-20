import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/ui/style.dart';

class AppContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? color;
  final Widget child;
  final bool needShadow;
  final double? height;
  final double? width;
  final Border? border;
  final LinearGradient? gradient;
  final Clip? clipBehaivor;
  const AppContainer({
    super.key,
    this.padding,
    this.borderRadius,
    this.color,
    required this.child,
    this.needShadow = false,
    this.height,
    this.width,
    this.border,
    this.gradient,
    this.clipBehaivor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDuration.d150,
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.all(16.sp),
      clipBehavior: clipBehaivor ?? Clip.hardEdge,
      decoration: BoxDecoration(
        color: color ?? AppColors.black,
        borderRadius: BorderRadius.circular(borderRadius ?? 16.sp),
        gradient: gradient,
        border: border,
        boxShadow: [
          if (needShadow) BoxShadow(color: AppColors.blackBck.withOpacity(0.9), blurRadius: 15.sp),
        ],
      ),
      child: child,
    );
  }
}
