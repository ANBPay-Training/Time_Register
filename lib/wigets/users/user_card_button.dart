import 'package:flutter/material.dart';
import 'package:time_register_flutter/models/user_model.dart';
import '../../screens/pin_page.dart';

class UserCardButton extends StatelessWidget {
  final AppUser user;
  final String branchName;

  const UserCardButton({
    super.key,
    required this.user,
    required this.branchName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          // med en halvgennemsigtig baggrund
          barrierColor: Colors.black.withOpacity(0.5),
          builder: (context) {
            return PinPage(user: user, branchname: branchName);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "ID: ${user.id}",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
