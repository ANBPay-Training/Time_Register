// SharedPreferences er et lagringssystem, der gemmer data som nøgle–værdi-par
import 'package:shared_preferences/shared_preferences.dart';

import '../models/work_day_model.dart';

class WorkDayStorage {
  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<void> saveWorkDataStorge(String userId, WorkDayModel m) async {
    final p = await _prefs;

    p.setString("${userId}_start", m.startWork?.toIso8601String() ?? "");
    p.setString("${userId}_end", m.endWork?.toIso8601String() ?? "");
    p.setString("${userId}_breakStart", m.breakStart?.toIso8601String() ?? "");
    p.setInt("${userId}_breakTotal", m.totalBreak.inSeconds);
  }

  static Future<void> loadWorkDataStorge(String userId, WorkDayModel m) async {
    final p = await _prefs;

    final start = p.getString("${userId}_start") ?? "";
    final end = p.getString("${userId}_end") ?? "";
    final breakS = p.getString("${userId}_breakStart") ?? "";
    final breakT = p.getInt("${userId}_breakTotal") ?? 0;

    m.startWork = start.isNotEmpty ? DateTime.parse(start) : null;
    m.endWork = end.isNotEmpty ? DateTime.parse(end) : null;
    m.breakStart = breakS.isNotEmpty ? DateTime.parse(breakS) : null;
    m.totalBreak = Duration(seconds: breakT);
  }

  static Future<void> clearUserStorage(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${userId}_startWork");
    await prefs.remove("${userId}_endWork");
    await prefs.remove("${userId}_breakStart");
    await prefs.remove("${userId}_totalBreak");
  }
}
