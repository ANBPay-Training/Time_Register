import 'package:flutter/material.dart';
import 'package:time_register_flutter/models/user_model.dart';
import '../wigets/app_back_button.dart';
import '../wigets/top_stepper.dart';
import '../wigets/users/user_card_button.dart';

class UsersPage extends StatelessWidget {
  final String branchName;

  final List<AppUser> users;

  const UsersPage({super.key, required this.branchName, required this.users});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2;
    final childAspectRatio = screenWidth > 600 ? 1.9 : 1.6;

    return Scaffold(
      backgroundColor: const Color(0xffF5F7F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopStepper(activeIndex: 2),

            const SizedBox(height: 30),

            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "User sign in",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Tap your user and enter PIN to register time",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ------- USER LIST -------
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GridView.count(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: childAspectRatio,
                            children: users.map((user) {
                              return UserCardButton(
                                user: user,
                                branchName: branchName,
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      // ------- BACK BUTTON -------
                      SizedBox(width: 120, child: AppBackButton()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
