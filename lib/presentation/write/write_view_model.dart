import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_why1/data/model/memo.dart';
import 'package:flutter/material.dart';

class WriteViewModel extends ChangeNotifier {
  final memosRef =
      FirebaseFirestore.instance.collection('memos').withConverter<Memo>(
            fromFirestore: (snapshot, _) => Memo.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  Future<void> write(String title, String body) async {
    await memosRef.add(Memo(title: title, body: body));
  }
}
