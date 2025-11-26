import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  final Widget child;

  const StatBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(child: child),
      ),
    );
  }
}
