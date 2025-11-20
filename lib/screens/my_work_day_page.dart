import 'package:flutter/material.dart';
import 'package:time_register_flutter/screens/user_page.dart';
import 'package:time_register_flutter/wigets/stat_column.dart';
import '../controllers/work_day_controller.dart';
import '../models/user_model.dart';
import '../models/work_day_model.dart';
import 'branch_page.dart';

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
  late WorkDayController workDayController;

  @override
  void initState() {
    super.initState();
    workDayController = WorkDayController(WorkDayModel());
    loadData();
  }

  Future<void> loadData() async {
    await workDayController.load(widget.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Work Day - ${widget.userName}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Start / End buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[200],
                    ),
                    onPressed: () async {
                      workDayController.startWork();
                      await workDayController.save(widget.userId);
                      setState(() {});
                    },
                    child: Text(
                      workDayController.model.startWork == null
                          ? "Start work"
                          : "Started: ${workDayController.formatTime(workDayController.model.startWork)}",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[200],
                    ),
                    onPressed: workDayController.canEndWork
                        ? () async {
                            workDayController.endWork();
                            await workDayController.save(widget.userId);
                            setState(() {});
                          }
                        : null,
                    child: Text(
                      workDayController.model.endWork == null
                          ? "End work"
                          : "Ended: ${workDayController.formatTime(workDayController.model.endWork)}",
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Break buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: workDayController.canStartBreak
                        ? () async {
                            workDayController.startBreak();
                            await workDayController.save(widget.userId);
                            setState(() {});
                          }
                        : null,
                    child: Text("Start break"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: workDayController.model.onBreak
                        ? () async {
                            workDayController.endBreak();
                            await workDayController.save(widget.userId);
                            setState(() {});
                          }
                        : null,
                    child: Text("End break"),
                  ),
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
                  value: workDayController.formatTime(
                    workDayController.model.startWork,
                  ),
                ),
                StatColumn(
                  title: 'Total break',
                  value: workDayController.model.totalBreakFormatted,
                ),
                StatColumn(
                  title: 'Worked',
                  value: workDayController.model.workedTime,
                ),
              ],
            ),

            SizedBox(height: 30),

            Text(
              "Timeline",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(value: 0, min: 0, max: 8, onChanged: (v) {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("0h"), Text("4h"), Text("8h")],
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text("Switch user"),
                  onPressed: () {
                    List<AppUser> selectedUsers = [];

                    if (widget.branchName == "City") {
                      selectedUsers = users_city;
                    } else if (widget.branchName == "Valby") {
                      selectedUsers = users_valby;
                    } else if (widget.branchName == "Airport") {
                      selectedUsers = users_airport;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserPage(
                          branchName: widget.branchName,
                          users: selectedUsers,
                        ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text("Switch branch"),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => BranchPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
