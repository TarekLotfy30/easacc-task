import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.data,
    required this.fontSize,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.color,
  });

  final String data;
  final double fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
