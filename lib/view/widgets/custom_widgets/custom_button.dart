import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.content,
      required this.style,
      this.onPressed,
      this.height,
      this.width});
  final Widget content;
  final ButtonStyle style;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 48,
        width: width ?? 130,
        child:
            ElevatedButton(style: style, onPressed: onPressed, child: content));
  }
}
