import 'package:flutter/material.dart';
import '../../controllers/work_day_controller.dart';

class StartBreakButton extends StatelessWidget {
  final String userId;
  final WorkDayController c;
  final VoidCallback onPressed;

  const StartBreakButton({
    super.key,
    required this.userId,
    required this.c,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool started = c.model.breakStart != null;

    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: c.canStartBreak
            ? () async {
                c.startBreak();
                await c.save(userId);
                onPressed();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          disabledBackgroundColor: Colors.grey[300],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        child: Text(
          started
              ? "Start break: ${c.formatTime(c.model.breakStart)}"
              : "Start break",
        ),
      ),
    );
  }
}
