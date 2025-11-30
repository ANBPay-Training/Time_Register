import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_register_flutter/core/constants/routes.dart';
import 'package:time_register_flutter/core/theme/app_theme.dart';
import 'package:time_register_flutter/screens/branches_page.dart';
import 'package:time_register_flutter/screens/login_page.dart';
import 'package:time_register_flutter/screens/users_page.dart';
import 'package:time_register_flutter/screens/error_page.dart';
import 'package:time_register_flutter/models/user_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Register',
      initialRoute: AppRoutes.login,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: _onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => _buildPage(settings));
  }

  Widget _buildPage(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return const AccountLoginPage();

      case AppRoutes.branches:
        return const BranchPage();

      case AppRoutes.users:
        return _buildUsersPage(settings.arguments);

      default:
        return ErrorPage(
          message: 'Route ${settings.name} not found',
          showHomeButton: true,
        );
    }
  }

  Widget _buildUsersPage(Object? arguments) {
    if (arguments is! Map<String, dynamic>) {
      return const ErrorPage(message: 'Invalid arguments for users page');
    }

    final branchName = arguments['branchName'] as String? ?? '';
    final users =
        (arguments['users'] as List<dynamic>?)?.whereType<AppUser>().toList() ??
        [];

    return UsersPage(branchName: branchName, users: users);
  }
}
