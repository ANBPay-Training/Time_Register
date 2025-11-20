import 'package:flutter/material.dart';

class PinDots extends StatelessWidget {
  final int length;
  // Denne widget tegner 4 små cirkler, som viser
  // hvor mange cifre der er indtastet i PIN-koden
  const PinDots({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: i < length ? Colors.black : Colors.black26,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
