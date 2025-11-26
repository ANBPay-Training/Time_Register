import 'package:flutter/material.dart';
import '../../controllers/work_day_controller.dart';

class StartWorkButton extends StatelessWidget {
  final WorkDayController c;
  final String userId;
  final VoidCallback onPressed;

  const StartWorkButton({
    super.key,
    required this.c,
    required this.userId,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isStarted = c.model.startWork != null;

    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: () async {
          c.startWork();
          await c.save(userId);
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isStarted ? Colors.green[200] : Colors.green[100],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        child: Text(
          isStarted
              ? "Started: ${c.formatTime(c.model.startWork)}"
              : "Start work",
        ),
      ),
    );
  }
}
