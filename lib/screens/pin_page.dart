import 'package:flutter/material.dart';
import 'package:time_register_flutter/wigets/pin/num_button.dart';
import '../models/user_model.dart';
import '../wigets/pin/delete_button.dart';
import '../wigets/pin/pin_dots.dart';
import 'my_work_day_page.dart';

class PinPage extends StatefulWidget {
  final AppUser user;
  final String branchname;

  const PinPage({super.key, required this.user, required this.branchname});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String pin = "";
  String? errorText;
  // Tilføj det nye ciffer til PIN-koden, hvis den endnu ikke er 4 cifre lang
  void _addDigit(String value) {
    if (pin.length < 4) {
      setState(() {
        pin += value;
      });
    }
  }

  void _deleteDigit() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  // Hvis PIN-koden er korrekt, gå videre til næste side. Hvis den er forkert,
  // vis en fejlbesked og start forfra
  void _submitPin() {
    if (pin == widget.user.pin) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MyWorkDayPage(
            userId: widget.user.id,
            userName: widget.user.name,
            branchName: widget.branchname,
          ),
        ),
      );
    } else {
      setState(() {
        errorText = "Wrong PIN!";
        pin = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              const Text(
                "Enter PIN",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),

              Text(
                "for ${widget.user.name}",
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),

              const SizedBox(height: 30),

              PinDots(length: pin.length),

              if (errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    errorText!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              SizedBox(height: 20),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumButton(number: "1", onTap: () => _addDigit("1")),
                      NumButton(number: "2", onTap: () => _addDigit("2")),
                      NumButton(number: "3", onTap: () => _addDigit("3")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumButton(number: "4", onTap: () => _addDigit("4")),
                      NumButton(number: "5", onTap: () => _addDigit("5")),
                      NumButton(number: "6", onTap: () => _addDigit("6")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumButton(number: "7", onTap: () => _addDigit("7")),
                      NumButton(number: "8", onTap: () => _addDigit("8")),
                      NumButton(number: "9", onTap: () => _addDigit("9")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 75, height: 75), // empty space
                      NumButton(number: "0", onTap: () => _addDigit("0")),
                      DeleteButton(onTap: _deleteDigit),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Buttons: Cancel / OK
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel", style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: pin.length == 4 ? _submitPin : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      "OK",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
