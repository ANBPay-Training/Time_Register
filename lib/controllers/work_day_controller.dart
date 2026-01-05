import '../models/work_day_model.dart';
import '../models/work_session.dart';
import '../models/work_break.dart';
import '../services/work_day_firestore_service.dart';

class WorkDayController {
  final WorkDayFirestoreService _service = WorkDayFirestoreService();

  WorkDayModel model = WorkDayModel();
  bool isLoading = false;
  String? error;

  // ---------- Load today's data ----------
  Future<void> load(String userId) async {
    try {
      isLoading = true;
      error = null;

      model = await _service.loadWorkDay(userId, DateTime.now());
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  // ---------- Save current state to Firestore ----------
  Future<void> save(String userId) async {
    try {
      await _service.saveWorkDay(userId, DateTime.now(), model);
    } catch (e) {
      error = e.toString();
    }
  }

  // ---------- Work actions ----------
  bool get canStartWork =>
      model.sessions.isEmpty || model.sessions.last.end != null;
  bool get canEndWork =>
      model.sessions.isNotEmpty && model.sessions.last.end == null;

  void startWork() {
    if (!canStartWork) return;
    model.sessions.add(WorkSession(start: DateTime.now()));
  }

  void endWork() {
    if (!canEndWork) return;
    model.sessions.last.end = DateTime.now();
  }

  // ---------- Break actions ----------
  bool get onBreak =>
      model.sessions.isNotEmpty &&
      model.sessions.last.breaks.isNotEmpty &&
      model.sessions.last.breaks.last.end == null;

  bool get canStartBreak => onBreak == false && canEndWork;
  bool get canEndBreak => onBreak;

  // Vi bruger last, fordi den seneste session altid er den aktive,
  // På den måde behøver vi ikke at loope eller søge i listerne.
  void startBreak() {
    if (!canStartBreak) return;
    model.sessions.last.breaks.add(WorkBreak(start: DateTime.now()));
  }

  void endBreak() {
    if (!canEndBreak) return;
    model.sessions.last.breaks.last.end = DateTime.now();
  }

  // ---------- Formatting ----------
  String formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    return "$h:${m.toString().padLeft(2, '0')}";
  }

  String get totalWorkedFormatted => formatDuration(model.totalWorkedToday);
  String get totalBreakFormatted => formatDuration(model.totalBreakToday);

  String formatTime(DateTime? d) {
    if (d == null) return "--:--";
    return "${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
  }

  // ---------- Getters ----------
  DateTime? get workStart =>
      model.sessions.isNotEmpty ? model.sessions.first.start : null;
  DateTime? get workEnd =>
      model.sessions.isNotEmpty ? model.sessions.last.end : null;
  DateTime? get breakStart =>
      onBreak ? model.sessions.last.breaks.last.start : null;
  double get totalWorkedHours {
    final total = model.totalWorkedToday;
    return total.inMinutes / 60.0;
  }
}
