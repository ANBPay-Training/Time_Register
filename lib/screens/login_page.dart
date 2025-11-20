import 'package:flutter/material.dart';
import 'package:time_register_flutter/wigets/top_stepper.dart';
import 'branch_page.dart';

class AccountLoginPage extends StatefulWidget {
  const AccountLoginPage({super.key});

  @override
  State<AccountLoginPage> createState() => _AccountLoginPageState();
}

class _AccountLoginPageState extends State<AccountLoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------------
            //   TOP STEPPER (Account active)
            // --------------------------
            TopStepper(activeIndex: 0),

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
                    // tilpasser sig indholdet og fylder ikke hele pladsen
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Account sign in",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Sign in with your company account",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),

                      const SizedBox(height: 25),

                      // ---------------------
                      // Email
                      // ---------------------
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "you@company.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          // Kant ved fokus (når brugeren skriver i feltet)
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.greenAccent,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ---------------------
                      // Password
                      // ---------------------
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: pass,
                        obscureText: true, // skjuler pin-code
                        decoration: InputDecoration(
                          hintText: "•••••••",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.greenAccent,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ---------------------
                      // Continue Button
                      // ---------------------
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const BranchPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent.shade400,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 16),
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
