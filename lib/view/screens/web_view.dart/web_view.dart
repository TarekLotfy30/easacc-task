import 'package:easacc_task/core/shared_components/app_text.dart';
import 'package:easacc_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// translate-me-ignore-all-file
class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url});

  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
        backgroundColor: AppColors.background,
        title: const AppText(
          data: 'Web View',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
