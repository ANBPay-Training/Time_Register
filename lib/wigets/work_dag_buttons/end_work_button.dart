import 'package:flutter/material.dart';
import 'package:time_register_flutter/controllers/work_day_controller.dart';

class EndWorkButton extends StatelessWidget {
  final WorkDayController c;
  final String userId;
  final VoidCallback onPressed;

  const EndWorkButton({
    super.key,
    required this.userId,
    required this.c,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red[200]),
        onPressed: c.canEndWork
            ? () async {
                c.endWork();
                await c.save(userId);
                onPressed();
              }
            : null,
        child: Text(
          c.model.endWork == null
              ? "End work"
              : "Ended: ${c.formatTime(c.model.endWork)}",
        ),
      ),
    );
  }
}
