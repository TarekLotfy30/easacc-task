import 'package:easacc_task/core/helpers/app_navigation.dart';
import 'package:easacc_task/core/helpers/app_regex.dart';
import 'package:easacc_task/core/routing/app_routes_name.dart';
import 'package:easacc_task/core/shared_components/app_button.dart';
import 'package:easacc_task/core/shared_components/app_text.dart';
import 'package:easacc_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// translate-me-ignore-all-file
class WebViewCard extends StatefulWidget {
  const WebViewCard({super.key});
  @override
  State<WebViewCard> createState() => _WebViewCardState();
}

class _WebViewCardState extends State<WebViewCard> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _urlController = TextEditingController(text: "https://easacc.com");
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                data: "Web View",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              TextFormField(
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                keyboardType: TextInputType.url,
                cursorColor: AppColors.primary,
                style: const TextStyle(color: Colors.white),
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'URL',
                ),
                controller: _urlController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (!AppRegex.isUrlValid(value)) {
                    return 'Please enter a valid URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              AppButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await AppNavigation.navigateTo(
                      context,
                      AppRoutesName.webViewScreen,
                      arguments: _urlController.text,
                    );
                  }
                },
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                child: const AppText(data: 'Open', fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
