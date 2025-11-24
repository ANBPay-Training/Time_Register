import 'package:flutter/material.dart';
import 'package:time_register_flutter/wigets/branch_card.dart';
import '../wigets/branch_card_buttons/back_button.dart';
import '../wigets/branch_card_buttons/continue_user_button.dart';
import '../wigets/top_stepper.dart';

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
                  BranchBackButton(),
                  const SizedBox(width: 10),
                  BranchContinueButton(selectedBranch: selectedBranch),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
