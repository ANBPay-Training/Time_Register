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
    final bool ended = c.workEnd != null;

    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: c.canEndWork
            ? () async {
                c.endWork();
                await c.save(userId);
                onPressed();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: ended ? Colors.red[200] : Colors.red[100],
          disabledBackgroundColor: Colors.red[50],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        child: Text(ended ? "Ended: ${c.formatTime(c.workEnd)}" : "End work"),
      ),
    );
  }
}
