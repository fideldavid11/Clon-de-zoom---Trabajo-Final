import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory {
    // Verifica si _auth.currentUser es nulo antes de acceder a uid
    final user = _auth.currentUser;
    if (user != null) {
      return _firestore
          .collection('users')
          .doc(user.uid)
          .collection('meetings')
          .snapshots();
    } else {
      // Devuelve un Stream vacío si _auth.currentUser es nulo
      return Stream.empty();
    }
  }

  void addAMeetingHistory(String meetingName) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('meetings')
            .add({
          'meetingName': meetingName,
          'createAt': DateTime.now(),
        });
      } else {
        print("Error: _auth.currentUser is null");
      }
    } catch (e) {
      print(e);
    }
  }
}
