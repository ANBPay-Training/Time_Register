import 'package:flutter/material.dart';
import 'package:time_register_flutter/wigets/log_in/email_text_field.dart';
import 'package:time_register_flutter/wigets/log_in/log_in_countinue_button.dart';
import 'package:time_register_flutter/wigets/top_stepper.dart';

import '../models/user_model.dart';
import '../services/user_firestore_service.dart';
import '../wigets/log_in/labeled_field.dart';
import '../wigets/log_in/password_text_field.dart';

class AccountLoginPage extends StatefulWidget {
  const AccountLoginPage({super.key});

  @override
  State<AccountLoginPage> createState() => _AccountLoginPageState();
}

class _AccountLoginPageState extends State<AccountLoginPage> {
  late final TextEditingController email;
  late final TextEditingController pass;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    pass = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

                      LabeledField(
                        label: "Email",
                        child: EmailTextField(email: email),
                      ),

                      const SizedBox(height: 20),

                      LabeledField(
                        label: "Password",
                        child: PasswordTextField(pass: pass),
                      ),
                      const SizedBox(height: 25),

                      SizedBox(width: 150, child: LogInCountinue(email, pass)),
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
