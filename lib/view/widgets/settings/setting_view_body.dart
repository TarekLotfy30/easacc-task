import 'package:easacc_task/core/utils/app_colors.dart';
import 'package:easacc_task/view/widgets/settings/web_view_card.dart';
import 'package:flutter/material.dart';

// translate-me-ignore-all-file
class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          WebViewCard(),
          Card(
            color: AppColors.cardBackground,
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
