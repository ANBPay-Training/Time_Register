import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  // Hvis dette er sat, vil back-knappen altid gå til denne route
  final String? forceRoute;

  const AppBackButton({super.key, this.forceRoute});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (forceRoute != null) {
          // همnaviger direkte til denne route og
          // fjern alle tidligere sider fra stackem
          Navigator.pushNamedAndRemoveUntil(
            context,
            forceRoute!,
            (route) => false,
          );
        } else if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        side: BorderSide(color: Colors.grey.shade400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: const Text(
        "Back",
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
