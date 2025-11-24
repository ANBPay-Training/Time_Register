import 'package:flutter/material.dart';

import 'package:time_register_flutter/wigets/work_dag_buttons/end_work_button.dart';
import 'package:time_register_flutter/wigets/work_dag_buttons/app_bar.dart';
import 'package:time_register_flutter/wigets/work_dag_buttons/start_break_button.dart';
import 'package:time_register_flutter/wigets/work_dag_buttons/start_work_button.dart';
import 'package:time_register_flutter/wigets/work_dag_buttons/switch_branch_button.dart';
import 'package:time_register_flutter/wigets/stat_column.dart';
import '../controllers/work_day_controller.dart';
import '../models/work_day_model.dart';
import '../wigets/work_dag_buttons/switch_users_page_button.dart';
import '../wigets/work_dag_buttons/end_break_button.dart';

class MyWorkDayPage extends StatefulWidget {
  final String userId;
  final String userName;
  final String branchName;

  const MyWorkDayPage({
    required this.userId,
    required this.userName,
    required this.branchName,
    super.key,
  });

  @override
  State<MyWorkDayPage> createState() => _MyWorkDayPageState();
}

class _MyWorkDayPageState extends State<MyWorkDayPage> {
  late WorkDayController c;

  @override
  void initState() {
    super.initState();
    c = WorkDayController(WorkDayModel());
    loadData();
  }

  Future<void> loadData() async {
    await c.load(widget.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final workedHours =
        double.tryParse(c.model.totalWorkedFormatted.split(":")[0]) ?? 0;

    return Scaffold(
      appBar: MyWorkDayAppBar(userName: widget.userName),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Start / End buttons
            Row(
              children: [
                StartWorkButton(
                  c: c,
                  userId: widget.userId,
                  onPressed: () => setState(() {}),
                ),
                SizedBox(width: 10),
                EndWorkButton(
                  userId: widget.userId,
                  c: c,
                  onPressed: () => setState(() {}),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Break buttons
            Row(
              children: [
                StartBreakButton(
                  userId: widget.userId,
                  c: c,
                  onPressed: () => setState(() {}),
                ),
                SizedBox(width: 10),
                EndBreakButton(
                  c: c,
                  userId: widget.userId,
                  onPressed: () => setState(() {}),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Statistics
            Text(
              "Statistics",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatColumn(
                  title: 'Started',
                  value: c.formatTime(c.model.startWork),
                ),
                StatColumn(
                  title: 'Total break',
                  value: c.model.totalBreakFormatted,
                ),
                StatColumn(
                  title: 'Worked',
                  value: c.model.totalWorkedFormatted,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Timeline",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: workedHours.clamp(0, 8),
              min: 0,
              max: 8,
              onChanged: null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("0h"), Text("4h"), Text("8h")],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SwitchUserButton(context, branchName: widget.branchName),
                SwitchBranchButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
