import 'package:easacc_task/core/shared_components.dart/app_button.dart';
import 'package:easacc_task/core/utils/app_colors.dart';
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
              decoration: BoxDecoration(
                color: AppColors.logoContainer,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            SizedBox(height: 20),
            Text("Welcome to Easacc"),
            SizedBox(height: 20),
            Text(
              "Securely access your network devices.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35),
            AppButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login),
                  SizedBox(width: 10),
                  Text("Continue with Google"),
                ],
              ),
            ),
            SizedBox(height: 30),
            AppButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login),
                  SizedBox(width: 10),
                  Text("Continue with Facebook"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
