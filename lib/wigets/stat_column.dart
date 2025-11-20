import 'package:flutter/material.dart';

class StatColumn extends StatelessWidget {
  final String title;
  final String value;
  const StatColumn({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
