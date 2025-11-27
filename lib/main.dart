import 'package:flutter/material.dart';
import 'package:time_register_flutter/screens/branches_page.dart';
import 'package:time_register_flutter/screens/login_page.dart';
import 'package:time_register_flutter/screens/my_work_day_page.dart';
import 'package:time_register_flutter/screens/users_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',

      routes: {
        '/branches': (context) => BranchPage(),
        '/login': (context) => AccountLoginPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
