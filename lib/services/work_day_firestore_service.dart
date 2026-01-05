import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/work_day_model.dart';

class WorkDayFirestoreService {
  // Denne service håndterer al kommunikation med Firestore
  final _db = FirebaseFirestore.instance;

  String _dayKey(DateTime d) =>
      "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

  Future<WorkDayModel> loadWorkDay(String userId, DateTime day) async {
    final doc = await _db
        .collection('users')
        .doc(userId)
        .collection('work_days')
        .doc(_dayKey(day))
        .get();

    if (!doc.exists) return WorkDayModel();
    return WorkDayModel.fromJson(doc.data()!);
  }

  Future<void> saveWorkDay(
    String userId,
    DateTime day,
    WorkDayModel model,
  ) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('work_days')
        .doc(_dayKey(day))
        .set(model.toJson(), SetOptions(merge: true));
  }

  Future<Duration> calculateTotalWork(String userId, DateTime day) async {
    final model = await loadWorkDay(userId, day);
    return model.totalWorkedToday;
  }
}
