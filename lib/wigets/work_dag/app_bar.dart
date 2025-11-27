import 'package:flutter/material.dart';
import 'dart:async';

// Implementerer PreferredSizeWidget for at angive en gyldig højde til AppBar.
class MyWorkDayAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String userName;
  const MyWorkDayAppBar({super.key, required this.userName});

  @override
  State<MyWorkDayAppBar> createState() => _MyWorkDayAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MyWorkDayAppBarState extends State<MyWorkDayAppBar> {
  late DateTime _now;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();

    // Timer til automatisk opdatering hvert minut
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Højden på AppBar’en
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Titel til venstre
          Text(
            " ${widget.userName}'s Work Day - ",
            style: TextStyle(fontSize: 18),
          ),
          // Dato og tid til højre
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${_now.day}.${_now.month}.${_now.year}",
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                "${_now.hour}:${_now.minute.toString().padLeft(2, '0')}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
