import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<AppUser>> getUsers(String branch) async {
    final snapshot = await _db
        .collection('branches')
        .doc(branch)
        .collection('users')
        .get();

    return snapshot.docs.map((doc) {
      return AppUser(id: doc.id, name: doc['name'], pin: doc['pin']);
    }).toList();
  }

  Future<void> addUser({required String branch, required AppUser user}) async {
    await _db
        .collection('branches')
        .doc(branch)
        .collection('users')
        .doc(user.id)
        .set({'name': user.name, 'pin': user.pin});
  }

  Future<void> addUsersToBranch({
    required String branch,
    required List<AppUser> users,
  }) async {
    for (final user in users) {
      await addUser(branch: branch, user: user);
    }
  }
}
