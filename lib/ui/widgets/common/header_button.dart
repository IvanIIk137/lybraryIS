import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_3/ui/style.dart';

class HeaderButton extends StatelessWidget {
  final VoidCallback onPress;
  final String icon;
  final Color? iconColor;
  final Color? bgColor;
  final double? size;
  final double? iconSize;
  final double? borderRadius;
  final double? padding;
  final Border? border;
  final BoxFit? fit;
  final BlendMode? blendMode;
  final bool withColor;

  const HeaderButton({
    super.key,
    required this.onPress,
    required this.icon,
    this.iconColor,
    this.bgColor,
    this.size,
    this.iconSize,
    this.borderRadius,
    this.padding,
    this.border,
    this.fit,
    this.blendMode,
    this.withColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            backgroundBlendMode: blendMode,
            color: bgColor ?? AppColors.black,
            borderRadius: BorderRadius.circular(borderRadius ?? 12.sp),
            border: border),
        width: size ?? 40.sp,
        height: size ?? 40.sp,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding ?? 10.sp),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: iconSize ?? 24.sp,
              height: iconSize ?? 24.sp,
              colorFilter: withColor ? ColorFilter.mode(iconColor ?? AppColors.white, BlendMode.srcIn) : null,
              fit: fit ?? BoxFit.none,
            ),
          ),
        ),
      ),
    );
  }
}
