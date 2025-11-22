import 'package:easacc_task/core/shared_components/app_button.dart';
import 'package:easacc_task/core/shared_components/app_svg.dart';
import 'package:easacc_task/core/shared_components/app_text.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    required this.buttonText,
  });
  final String icon;
  final void Function()? onPressed;
  final String buttonText;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: backgroundColor ?? Colors.white,
      foregroundColor: foregroundColor ?? Colors.black,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSvg(assetPath: icon),
          SizedBox(width: 10),
          AppText(data: buttonText, fontSize: 16),
        ],
      ),
    );
  }
}
