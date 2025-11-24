import 'package:flutter/material.dart';
import 'package:time_register_flutter/controllers/work_day_controller.dart';

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
    return Expanded(
      child: ElevatedButton(
        onPressed: c.canStartBreak
            ? () async {
                c.startBreak();
                await c.save(userId);
                onPressed();
              }
            : null,
        child: Text(
          c.model.breakStart == null
              ? "Start break"
              : "Start break: ${c.formatTime(c.model.breakStart)}",
        ),
      ),
    );
  }
}
