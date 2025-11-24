import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../screens/user_page.dart';

class BranchContinueButton extends StatelessWidget {
  final String? selectedBranch;

  const BranchContinueButton({super.key, required this.selectedBranch});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: selectedBranch == null
            ? null
            : () {
                List<AppUser> selectedUsers = [];

                if (selectedBranch == "City") {
                  selectedUsers = users_city;
                } else if (selectedBranch == "Valby") {
                  selectedUsers = users_valby;
                } else if (selectedBranch == "Airport") {
                  selectedUsers = users_airport;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserPage(
                      branchName: selectedBranch!,
                      users: selectedUsers,
                    ),
                  ),
                );
              },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: Colors.greenAccent.shade400,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("Continue", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
