import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  //Make connection with firestore
  final CollectionReference collection = 
    FirebaseFirestore.instance.collection('database');

  // Store data to database
  Future<void> store (String data) {
    return collection.add({
      'title': data,
      'timestamp': Timestamp.now(),
    });
  }

  // Read data from database
  Stream<QuerySnapshot> getData() {
    final dataStream = collection.orderBy('timestamp', descending: true).snapshots();

    return dataStream;
  }

  //Edit data
  Future<void> update(String docId, String title) {
    return collection.doc(docId).update({
      'title': title,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete Data
  Future<void> destroy(String docId) {
    return collection.doc(docId).delete();
  }
}