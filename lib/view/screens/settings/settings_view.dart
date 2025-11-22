import 'package:easacc_task/core/shared_components/app_text.dart';
import 'package:easacc_task/core/utils/app_colors.dart';
import 'package:easacc_task/view/widgets/settings/setting_view_body.dart';
import 'package:flutter/material.dart';

// translate-me-ignore-all-file
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
        backgroundColor: AppColors.background,
        title: const AppText(
          data: 'Settings',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SettingViewBody(),
    );
  }
}
