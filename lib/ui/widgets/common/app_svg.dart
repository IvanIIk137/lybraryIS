import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvg extends StatelessWidget {
  final String icon;
  final Color? color;
  final BlendMode? blendMode;
  final BoxFit? fit;
  final Size? size;
  const AppSvg({super.key, required this.icon, this.color, this.blendMode, this.fit, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: color != null ? ColorFilter.mode(color!, blendMode ?? BlendMode.srcIn) : null,
      fit: fit ?? BoxFit.cover,
      height: size?.height,
    );
  }
}
