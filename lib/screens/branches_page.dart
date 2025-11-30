import 'package:flutter/material.dart';
import 'package:time_register_flutter/wigets/branch/branch_card.dart';
import '../wigets/app_back_button.dart';
import '../wigets/branch/branch_continue_button.dart';
import '../wigets/top_stepper.dart';

class BranchPage extends StatefulWidget {
  final int currentStep;
  const BranchPage({this.currentStep = 1, super.key});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  String? selectedBranch;

  late final screenWidth = MediaQuery.of(context).size.width;

  // Bestem antal kolonner baseret på skærmbredden
  late int crossAxisCount = screenWidth > 600 ? 3 : 2;

  // Bestem forholdet mellem kortets bredde og højde
  late double childAspectRatio = screenWidth > 600 ? 2.0 : 1.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  crossAxisCount: crossAxisCount, // antal af passende kolonner
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio:
                      childAspectRatio, // den justerer kortenes størrelse
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
                  Expanded(
                    child: AppBackButton(
                      forceRoute: '/login', // altid gå til denne route
                    ),
                  ),
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
