import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController email;
  EmailTextField({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: email,
      decoration: InputDecoration(
        hintText: "you@company.com",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        // Kant ved fokus (når brugeren skriver i feltet)
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
