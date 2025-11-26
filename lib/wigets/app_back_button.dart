import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.pop(context),
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
