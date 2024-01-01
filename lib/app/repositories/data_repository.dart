
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {

  final _db = FirebaseFirestore.instance;

  Future<Map?> fetchData() async {
    final collection = _db.collection("landing_data");
    final docRef = collection.doc("email");
    return (await docRef.get()).data() as Map<String, dynamic>;
  }

}