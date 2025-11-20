import '../models/work_day_model.dart';
import '../services/work_day_storage.dart';

class WorkDayController {
  final WorkDayModel model;

  WorkDayController(this.model);

  // -------- Getters for UI --------
  bool get canStartWork => !model.isWorking && model.startWork == null;
  bool get canEndWork => model.isWorking;
  bool get canStartBreak => model.isWorking && !model.onBreak;
  bool get canEndBreak => model.onBreak;

  String formatTime(DateTime? dt) {
    if (dt == null) return "--";
    return "${dt.hour}.${dt.minute.toString().padLeft(2, '0')}";
  }

  // -------- Actions --------
  void startWork() => model.startWorkNow();
  void endWork() => model.endWorkNow();
  void startBreak() => model.startBreak();
  void endBreak() => model.endBreak();

  // -------- Persistence --------
  Future<void> load(String userId) async {
    final data = await WorkDayStorage.loadWorkData(userId);
    model.startWork = data["startWork"];
    model.endWork = data["endWork"];
    model.breakStart = data["breakStart"];
    model.totalBreak = data["totalBreak"];
  }

  Future<void> save(String userId) async {
    await WorkDayStorage.saveWorkData(
      userId: userId,
      start: model.startWork,
      end: model.endWork,
      breakStart: model.breakStart,
      breakDuration: model.totalBreak,
    );
  }
}
