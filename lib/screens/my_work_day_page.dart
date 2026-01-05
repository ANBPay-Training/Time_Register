import 'package:flutter/material.dart';
import 'package:time_register_flutter/wigets/work_dag/stat_column.dart';
import '../controllers/work_day_controller.dart';
import '../core/constants/app_constants.dart';
import '../models/work_day_model.dart';
import '../wigets/work_dag/app_bar.dart';
import '../wigets/work_dag/end_break_button.dart';
import '../wigets/work_dag/end_work_button.dart';
import '../wigets/work_dag/start_break_button.dart';
import '../wigets/work_dag/start_work_button.dart';
import '../wigets/work_dag/stat_box.dart';
import '../wigets/work_dag/switch_branch_button.dart';
import '../wigets/work_dag/switch_users_page_button.dart';

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
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    c = WorkDayController();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await c.load(widget.userId);
      if (mounted) setState(() => isLoading = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final workedHours = c.totalWorkedHours.clamp(0, 8);

    return Scaffold(
      appBar: MyWorkDayAppBar(userName: widget.userName),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Start / End Work buttons
            Row(
              children: [
                Expanded(
                  child: StartWorkButton(
                    c: c,
                    userId: widget.userId,
                    onPressed: () => setState(() {}),
                  ),
                ),
                SizedBox(width: AppConstants.spacingMedium),
                Expanded(
                  child: EndWorkButton(
                    userId: widget.userId,
                    c: c,
                    onPressed: () => setState(() {}),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacingLarge),

            // Start / End Break buttons
            Row(
              children: [
                Expanded(
                  child: StartBreakButton(
                    userId: widget.userId,
                    c: c,
                    onPressed: () => setState(() {}),
                  ),
                ),
                SizedBox(width: AppConstants.spacingMedium),
                Expanded(
                  child: EndBreakButton(
                    c: c,
                    userId: widget.userId,
                    onPressed: () => setState(() {}),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacingXLarge),

            // Statistics
            Text(
              "Statistics",
              style: AppConstants.buttonTextStyle.copyWith(fontSize: 22),
            ),
            const SizedBox(height: AppConstants.spacingMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatBox(
                  child: StatColumn(
                    title: 'Started',
                    value: c.formatTime(c.workStart),
                  ),
                ),
                StatBox(
                  child: StatColumn(
                    title: 'Total break',
                    value: c.totalBreakFormatted,
                  ),
                ),
                StatBox(
                  child: StatColumn(
                    title: 'Worked',
                    value: c.totalWorkedFormatted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacingXLarge),

            // Timeline
            Text(
              "Timeline",
              style: AppConstants.buttonTextStyle.copyWith(fontSize: 22),
            ),
            Slider(
              value: workedHours.clamp(0, 8).toDouble(),
              min: 0,
              max: 8,
              onChanged: null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("0h"), Text("4h"), Text("8h")],
            ),
            const Spacer(),

            // Switch User / Branch buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SwitchUserButton(branchName: widget.branchName),
                SwitchBranchButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
