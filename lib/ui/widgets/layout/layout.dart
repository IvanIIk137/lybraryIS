import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Layout extends StatelessWidget {
  final Widget? child;

  Layout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: child,
      ),
    );
  }
}
