import 'package:easacc_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  final Widget child;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        foregroundColor: foregroundColor ?? Colors.white,
        elevation: 2,
        surfaceTintColor: AppColors.primary,
        overlayColor: AppColors.primary.withValues(alpha: 0.12),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 20),
        minimumSize: const Size(double.maxFinite, 48),
        // textStyle: AppTypography.displayMedium.copyWith(
        //   fontWeight: AppFontWeight.medium,
        //   fontFamily: AppFontFamilyEnum.cairo.name,
        // ),
      ),
      child: child,
    );
  }
}
