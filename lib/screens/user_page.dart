import 'package:flutter/material.dart';
import 'package:time_register_flutter/models/user_model.dart';
import '../wigets/top_stepper.dart';
import '../wigets/user_button.dart';
import 'pin_page.dart';

class UserPage extends StatelessWidget {
  final String branchName;

  final List<AppUser> users;

  const UserPage({super.key, required this.branchName, required this.users});

  @override
  Widget build(BuildContext context) {
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
                  width: 450,
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
                        child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                UserButton(
                                  user: users[index],
                                  branchName: branchName,
                                ),
                                const SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                      ),

                      // ------- BACK BUTTON -------
                      SizedBox(
                        width: 120,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                            side: BorderSide(color: Colors.grey.shade400),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
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
