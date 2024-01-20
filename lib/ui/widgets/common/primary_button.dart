import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';

class PrimaryButton extends StatelessWidget {
  final double? borderRadius;
  final String title;
  final String? icon;
  final String? prefixIcon;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? depth;
  final VoidCallback onPress;
  final bool spinner;
  final EdgeInsets? contentPadding;
  final bool minSize;
  final Widget? child;
  final bool isUpperCase;
  final Color? bgColor;
  final bool disabled;
  final bool needIconColor;
  final MainAxisAlignment? mainAxisAlignment;
  final bool needHeight;
  final LinearGradient? gradient;

  const PrimaryButton({
    Key? key,
    this.borderRadius,
    required this.title,
    this.height,
    this.width,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    required this.onPress,
    this.spinner = false,
    this.icon,
    this.depth,
    this.contentPadding,
    this.minSize = false,
    this.child,
    this.isUpperCase = false,
    this.bgColor,
    this.disabled = false,
    this.needIconColor = true,
    this.prefixIcon,
    this.mainAxisAlignment,
    this.needHeight = true,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => disabled ? null : onPress(),
      child: Container(
        height: height ?? (needHeight ? 40.sp : null),
        width: width,
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(borderRadius ?? 12.sp),
            gradient: bgColor != null
                ? null
                : (gradient ??
                    LinearGradient(
                      colors: [AppColors.violet, AppColors.primaryBlue],
                    ))),
        child: Padding(
          padding: contentPadding ?? EdgeInsets.all(height != null ? 2.sp : 13.sp),
          child: Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            mainAxisSize: minSize ? MainAxisSize.min : MainAxisSize.max,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: EdgeInsets.only(right: 6.sp),
                  child: SvgPicture.asset(
                    prefixIcon!,
                    colorFilter: needIconColor ? ColorFilter.mode((textColor ?? Colors.black), BlendMode.srcIn) : null,
                  ),
                ),
              Center(
                  child: AppText(
                      isUpperCase ? title.toUpperCase() : title[0].toUpperCase() + title.substring(1).toLowerCase(),
                      fontSize: fontSize ?? 12.sp,
                      color: spinner ? AppColors.white : textColor ?? Colors.white,
                      fontWeight: fontWeight ?? FontWeight.w500)),
              if (icon != null)
                Padding(
                  padding: EdgeInsets.only(left: 6.sp),
                  child: SvgPicture.asset(icon!,
                      colorFilter:
                          needIconColor ? ColorFilter.mode((textColor ?? Colors.black), BlendMode.srcIn) : null),
                ),
              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}
