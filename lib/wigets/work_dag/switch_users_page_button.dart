import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../screens/users_page.dart';

class SwitchUserButton extends StatelessWidget {
  final String branchName;

  const SwitchUserButton({super.key, required this.branchName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("Switch user"),
      onPressed: () {
        final branchUsers = {
          "City": users_city,
          "Valby": users_valby,
          "Airport": users_airport,
        };

        final selectedUsers = branchUsers[branchName] ?? [];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                UsersPage(branchName: branchName, users: selectedUsers),
          ),
        );
      },
    );
  }
}
