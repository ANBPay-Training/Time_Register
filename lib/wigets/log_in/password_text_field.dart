import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController pass;
  PasswordTextField({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pass,
      obscureText: true, // skjuler pin-code
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
