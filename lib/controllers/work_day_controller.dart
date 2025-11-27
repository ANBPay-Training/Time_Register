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

  // -------- Persistence with error handling --------
  Future<void> load(String userId) async {
    try {
      await WorkDayStorage.loadWorkDataStorge(userId, model);
    } catch (e) {
      // Re-throw with more context
      throw Exception('Controller failed to load data for user $userId: $e');
    }
  }

  Future<void> save(String userId) async {
    try {
      await WorkDayStorage.saveWorkDataStorge(userId, model);
    } catch (e) {
      throw Exception('Controller failed to save data for user $userId: $e');
    }
  }

  Future<void> clear(String userId) async {
    try {
      await WorkDayStorage.clearUserStorage(userId);
      // reset model
      model.startWork = null;
      model.endWork = null;
      model.breakStart = null;
      model.totalBreak = Duration.zero;
    } catch (e) {
      throw Exception('Controller failed to clear data for user $userId: $e');
    }
  }
}
