import 'package:easacc_task/core/helpers/app_navigation.dart';
import 'package:easacc_task/core/helpers/navigation_extension.dart';
import 'package:easacc_task/core/routing/app_routes_name.dart';
import 'package:easacc_task/core/shared_components/app_text.dart';
import 'package:easacc_task/core/utils/app_colors.dart';
import 'package:easacc_task/core/utils/app_icons.dart';
import 'package:easacc_task/core/utils/app_images.dart';
import 'package:easacc_task/view/widgets/login/social_button.dart';
import 'package:flutter/material.dart';

// translate-me-ignore-all-file
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.logoContainer,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 32),
            const AppText(
              data: "Welcome to Easacc",
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
              letterSpacing: -0.5,
            ),
            SizedBox(height: 8),
            const AppText(
              data: 'Securely access your network devices.',
              fontSize: 16,
              color: AppColors.secondaryTextColor,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(height: 40),
            SocialButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              icon: AppIcons.google,
              buttonText: 'Continue with Google',
              onPressed: () async {
                await AppNavigation.navigateTo(
                  context,
                  AppRoutesName.settingsScreen,
                );
              },
            ),
            SizedBox(height: 16),
            SocialButton(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              icon: AppIcons.facebook,
              buttonText: 'Continue with Facebook',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
