import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_3/ui/style.dart';
import 'package:task_3/ui/widgets/common/app_text.dart';

class InfoRow extends StatelessWidget {
  final String name;
  final String info;
  const InfoRow({super.key, required this.name, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          name,
          fontSize: 12.sp,
          color: AppColors.greyLight,
        ),
        AppText(
          info,
          fontSize: 12.sp,
        )
      ],
    );
  }
}
