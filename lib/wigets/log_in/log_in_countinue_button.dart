import 'package:flutter/material.dart';

import '../../screens/branches_page.dart';

class LogInCountinue extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController pass;
  LogInCountinue(this.email, this.pass, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final inputEmail = email.text.trim();
        final inputPass = pass.text.trim();
        // videre til næste side, hvis email you@company.com og adgangskode er korrekte
        if (inputEmail == "1" && inputPass.length == 1) {
          Navigator.pushReplacementNamed(context, '/branches');
        } else {
          // Fejlmeddelelse
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email or password is incorrect"),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Continue", style: TextStyle(fontSize: 16)),
    );
  }
}
