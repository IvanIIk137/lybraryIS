import 'package:flutter/material.dart';
import 'package:task_3/ui/style.dart';

class PageLayout extends StatelessWidget {
  final Widget child;

  PageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackBck,
      child: child,
    );
  }
}
