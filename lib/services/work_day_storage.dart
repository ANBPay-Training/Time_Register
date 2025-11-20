import 'package:shared_preferences/shared_preferences.dart';

class WorkDayStorage {
  static Future<void> saveWorkData({
    required String userId,
    required DateTime? start,
    required DateTime? end,
    required DateTime? breakStart,
    required Duration breakDuration,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      "${userId}_startWork",
      start?.toIso8601String() ?? "",
    );
    await prefs.setString("${userId}_endWork", end?.toIso8601String() ?? "");
    await prefs.setString(
      "${userId}_breakStart",
      breakStart?.toIso8601String() ?? "",
    );
    await prefs.setInt("${userId}_totalBreak", breakDuration.inSeconds);
  }

  static Future<Map<String, dynamic>> loadWorkData(String userId) async {
    final prefs = await SharedPreferences.getInstance();

    String start = prefs.getString("${userId}_startWork") ?? "";
    String end = prefs.getString("${userId}_endWork") ?? "";
    String breakStart = prefs.getString("${userId}_breakStart") ?? "";
    int breakSec = prefs.getInt("${userId}_totalBreak") ?? 0;

    return {
      "startWork": start.isNotEmpty ? DateTime.parse(start) : null,
      "endWork": end.isNotEmpty ? DateTime.parse(end) : null,
      "breakStart": breakStart.isNotEmpty ? DateTime.parse(breakStart) : null,
      "totalBreak": Duration(seconds: breakSec),
    };
  }

  static Future<void> clearUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${userId}_startWork");
    await prefs.remove("${userId}_endWork");
    await prefs.remove("${userId}_breakStart");
    await prefs.remove("${userId}_totalBreak");
  }
}
