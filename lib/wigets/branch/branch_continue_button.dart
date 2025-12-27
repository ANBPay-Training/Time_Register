import 'package:flutter/material.dart';
import '../../screens/users_page.dart';
import '../../services/firestore_service.dart';

class BranchContinueButton extends StatelessWidget {
  final String? selectedBranch;

  BranchContinueButton({super.key, required this.selectedBranch});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: selectedBranch == null
            ? null
            : () async {
                final firestoreService = FirestoreService();

                // Get users based on selected branch
                final selectedUsers = await firestoreService.getUsers(
                  selectedBranch!.toLowerCase(),
                );
                // Navigate to UsersPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UsersPage(
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
