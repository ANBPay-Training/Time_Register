import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../screens/user_page.dart';

class SwitchUserButton extends StatelessWidget {
  final String branchName;

  const SwitchUserButton(
    BuildContext context, {
    super.key,
    required this.branchName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Switch user"),
      onPressed: () {
        List<AppUser> selectedUsers = [];

        if (branchName == "City") {
          selectedUsers = users_city;
        } else if (branchName == "Valby") {
          selectedUsers = users_valby;
        } else if (branchName == "Airport") {
          selectedUsers = users_airport;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                UserPage(branchName: branchName, users: selectedUsers),
          ),
        );
      },
    );
  }
}
