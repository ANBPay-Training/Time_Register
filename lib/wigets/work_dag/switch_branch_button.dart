import 'package:flutter/material.dart';

class SwitchBranchButton extends StatelessWidget {
  const SwitchBranchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Switch branch"),
      onPressed: () {
        Navigator.pushNamed(context, '/branches');
      },
    );
  }
}
