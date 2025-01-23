import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices implements DatabaseServices {
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await FirebaseFirestore.instance.collection(path).doc(docId).set(data);
    } else {
      await FirebaseFirestore.instance.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    var data =
        await FirebaseFirestore.instance.collection(path).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExist(
      {required String path, required String docId}) async {
    var data =
        await FirebaseFirestore.instance.collection(path).doc(docId).get();
    return data.exists;
  }
}

abstract class DatabaseServices {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data, String docId});
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId});
  Future<bool> checkIfDataExist({required String path, required String docId});
}
