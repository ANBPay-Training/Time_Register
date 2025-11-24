import 'package:flutter/material.dart';

// Implementerer PreferredSizeWidget for at angive en gyldig højde til AppBar.
class MyWorkDayAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  const MyWorkDayAppBar({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Højden på AppBar’en
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Titel til venstre
          Text("My Work Day - ${userName}", style: TextStyle(fontSize: 18)),
          // Dato og tid til højre
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
