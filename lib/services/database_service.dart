import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> saveUserData({required String email}) async {
    try {
      await userCollection.doc(uid).set({
        'email': email,
        'createdAt': Timestamp.now(),
      }, SetOptions(merge: true));
    } catch (e) {
      print('❌ Firestore error: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      DocumentSnapshot snapshot = await userCollection.doc(uid).get();
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      print('❌ Fetch user data error: $e');
      return null;
    }
  }
}
