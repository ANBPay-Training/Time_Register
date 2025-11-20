import 'package:flutter/material.dart';

class TopStepper extends StatelessWidget {
  final int activeIndex;
  final List<String> steps;

  const TopStepper({
    super.key,
    required this.activeIndex,
    this.steps = const ["Account", "Branch", "User", "My Work Day"],
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(steps.length, (i) {
        Color lineColor;
        if (i < activeIndex) {
          lineColor = Colors.greenAccent.shade400;
        } else if (i == activeIndex) {
          lineColor = Colors.greenAccent.shade100;
        } else {
          lineColor = Colors.grey.shade300;
        }

        return Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 4,
              width: 150,
              decoration: BoxDecoration(
                color: lineColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              steps[i],
              style: TextStyle(
                fontSize: 13,
                color: i <= activeIndex ? Colors.black : Colors.grey,
                fontWeight: i <= activeIndex
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        );
      }),
    );
  }
}
