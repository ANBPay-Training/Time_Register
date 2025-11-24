import 'package:flutter/material.dart';

class BranchCard extends StatelessWidget {
  final String title;
  final String code;
  final bool selected;
  final VoidCallback onTap;

  const BranchCard({
    super.key,
    required this.title,
    required this.code,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        // For at forhindre, at indholdet bliver presset sammen
        constraints: const BoxConstraints(minHeight: 80),
        decoration: BoxDecoration(
          color: selected ? Colors.greenAccent.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? Colors.greenAccent.shade400
                : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.green.shade700 : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              code,
              style: TextStyle(
                color: selected ? Colors.green.shade700 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
