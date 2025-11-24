import '../models/work_day_model.dart';
import '../services/work_day_storage.dart';

class WorkDayController {
  final WorkDayModel model;

  WorkDayController(this.model);

  // -------- Getters for UI --------
  bool get canEndWork => model.isWorking;
  bool get canStartBreak => model.isWorking && !model.onBreak;

  String formatTime(DateTime? dt) =>
      dt == null ? "--" : "${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";

  // -------- Actions --------
  void startWork() => model.startWorkNow();
  void endWork() => model.endWorkNow();
  void startBreak() => model.startBreak();
  void endBreak() => model.endBreak();

  // -------- Persistence --------
  Future<void> load(String userId) async =>
      await WorkDayStorage.loadWorkDataStorge(userId, model);

  Future<void> save(String userId) async =>
      await WorkDayStorage.saveWorkDataStorge(userId, model);
}
