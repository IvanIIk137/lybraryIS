import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/enums.dart';
import 'package:task_3/ui/style.dart';

class AppTapBar extends StatelessWidget {
  final TabController tabController;
  final bool isScrollable;
  final List<Option> options;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;
  final BoxDecoration? indicatorDecoration;
  final TabBarIndicatorSize indicatorSize;
  final Color? unselectedColor;
  final double? height;
  final VoidCallback? onPress;
  const AppTapBar({
    super.key,
    required this.tabController,
    this.isScrollable = false,
    required this.options,
    this.padding,
    this.labelStyle,
    this.indicatorDecoration,
    this.indicatorSize = TabBarIndicatorSize.label,
    this.unselectedColor,
    this.height,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        labelPadding: padding ?? EdgeInsets.only(right: 30.sp),
        indicator: indicatorDecoration,
        indicatorColor: AppColors.primaryBlue,
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: indicatorSize,
        unselectedLabelColor: unselectedColor ?? AppColors.greyLight,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
        isScrollable: isScrollable,
        onTap: onPress != null ? (index) => onPress!() : null,
        labelStyle: labelStyle ??
            TextStyle(
              fontSize: 12.sp,
              height: 2.5,
              fontWeight: FontWeight.w500,
              fontFamily: AppFontFamily.primary,
            ),
        tabs: [
          ...options.map(
            (item) => SizedBox(
              height: height,
              child: Tab(
                iconMargin: EdgeInsets.zero,
                text: item.label,
              ),
            ),
          )
        ],
        controller: tabController,
      ),
    );
  }
}
