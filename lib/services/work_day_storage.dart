// SharedPreferences er et lagringssystem, der gemmer data som nøgle–værdi-par
import 'package:shared_preferences/shared_preferences.dart';

import '../models/work_day_model.dart';

class WorkDayStorage {
  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<void> saveWorkDataStorge(String userId, WorkDayModel m) async {
    try {
      final p = await _prefs;

      await p.setString(
        "${userId}_start",
        m.startWork?.toIso8601String() ?? "",
      );
      await p.setString("${userId}_end", m.endWork?.toIso8601String() ?? "");
      await p.setString(
        "${userId}_breakStart",
        m.breakStart?.toIso8601String() ?? "",
      );
      await p.setInt("${userId}_breakTotal", m.totalBreak.inSeconds);
    } catch (e) {
      throw StorageException('Failed to save work data: $e');
    }
  }

  static Future<void> loadWorkDataStorge(String userId, WorkDayModel m) async {
    try {
      final p = await _prefs;

      final start = p.getString("${userId}_start") ?? "";
      final end = p.getString("${userId}_end") ?? "";
      final breakS = p.getString("${userId}_breakStart") ?? "";
      final breakT = p.getInt("${userId}_breakTotal") ?? 0;

      m.startWork = start.isNotEmpty ? DateTime.parse(start) : null;
      m.endWork = end.isNotEmpty ? DateTime.parse(end) : null;
      m.breakStart = breakS.isNotEmpty ? DateTime.parse(breakS) : null;
      m.totalBreak = Duration(seconds: breakT);
    } on FormatException catch (e) {
      throw StorageException('Invalid date format in storage: $e');
    } catch (e) {
      throw StorageException('Failed to load work data: $e');
    }
  }

  static Future<void> clearUserStorage(String userId) async {
    try {
      final prefs = await _prefs;
      await prefs.remove("${userId}_start");
      await prefs.remove("${userId}_end");
      await prefs.remove("${userId}_breakStart");
      await prefs.remove("${userId}_breakTotal");
    } catch (e) {
      throw StorageException('Failed to clear user storage: $e');
    }
  }
}

// Custom exception for storage errors
class StorageException implements Exception {
  final String message;
  StorageException(this.message);

  @override
  String toString() => message;
}
