import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as FStore;

class HomeListProvider extends ChangeNotifier {

  Stream<FStore.QuerySnapshot<Map<String, dynamic>>> fetchResumes() {
    return FStore.FirebaseFirestore.instance.collection('resumes').snapshots();
  }
}
