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
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: c.onBreak
            ? () async {
                c.endBreak();
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
        child: const Text("End break"),
      ),
    );
  }
}
