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
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[200]),
        onPressed: () async {
          c.startWork();
          await c.save(userId);
          onPressed();
        },
        child: Text(
          c.model.startWork == null
              ? "Start work"
              : "Started: ${c.formatTime(c.model.startWork)}",
        ),
      ),
    );
  }
}
