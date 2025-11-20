import 'package:flutter/material.dart';
import 'package:time_register_flutter/wigets/branch_card.dart';
import '../models/user_model.dart';
import '../wigets/top_stepper.dart';
import 'user_page.dart';

class BranchPage extends StatefulWidget {
  final int currentStep;
  const BranchPage({this.currentStep = 1, super.key});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  String? selectedBranch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopStepper(activeIndex: widget.currentStep),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Branch sign in",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Choose your branch to continue",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2, // to kolonner
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3.5, // den justerer kortenes størrelse
                  children: [
                    BranchCard(
                      title: "Valby",
                      code: "VALBY-01",
                      selected: selectedBranch == "Valby",
                      onTap: () => setState(() => selectedBranch = "Valby"),
                    ),
                    BranchCard(
                      title: "City",
                      code: "CITY-01",
                      selected: selectedBranch == "City",
                      onTap: () => setState(() => selectedBranch = "City"),
                    ),
                    BranchCard(
                      title: "Airport",
                      code: "AIR-01",
                      selected: selectedBranch == "Airport",
                      onTap: () => setState(() => selectedBranch = "Airport"),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  _buttonBack(),
                  const SizedBox(width: 10),
                  _buttonContinue(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------
  // BUTTONS
  // ---------------------
  Widget _buttonBack() {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("Back", style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buttonContinue() {
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
