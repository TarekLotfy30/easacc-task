// ═══════════════════════════════════════════════════════════════
// ROUTER
// ═══════════════════════════════════════════════════════════════
import 'package:easacc_task/core/routing/app_routes_name.dart';
import 'package:easacc_task/view/screens/login/login_view.dart';
import 'package:easacc_task/view/screens/settings/settings_view.dart';
import 'package:easacc_task/view/screens/web_view.dart/web_view.dart';
import 'package:easacc_task/view_models/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.loginScreen:
        return _build(
          child: BlocProvider(
            create: (context) => SignInCubit(),
            child: const LoginView(),
          ),
        );
      case AppRoutesName.settingsScreen:
        return _build(child: const SettingsView());
      case AppRoutesName.webViewScreen:
        final url = settings.arguments as String;
        return _build(child: WebViewScreen(url: url));
      default:
        return null;
    }
  }

  MaterialPageRoute _build({required Widget child}) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
