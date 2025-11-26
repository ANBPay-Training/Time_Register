import 'package:flutter/material.dart';

class LabeledField extends StatelessWidget {
  late final String label;
  late final Widget child;

  LabeledField({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
