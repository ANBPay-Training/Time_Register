import 'package:flutter/material.dart';
import 'package:time_register_flutter/controllers/work_day_controller.dart';

class EndBreakButton extends StatelessWidget {
  final WorkDayController c;
  final String userId;
  final VoidCallback onPressed;

  const EndBreakButton({
    super.key,
    required this.c,
    required this.userId,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: c.model.onBreak
            ? () async {
                c.endBreak();
                await c.save(userId);
                onPressed();
              }
            : null,
        child: Text("End break "),
      ),
    );
  }
}
