import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spinner extends StatelessWidget {
  final double? size;
  final Color color;
  final double? lineWidth;

  Spinner({
    this.color = Colors.grey,
    this.size,
    this.lineWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(
        color: color,
        size: size ?? 40.sp,
        lineWidth: lineWidth ?? 5.sp,
      ),
    );
  }
}