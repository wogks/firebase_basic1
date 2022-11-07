import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_why1/data/model/memo.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('log out'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            ElevatedButton(
              child: const Text('글쓰기 페이지'),
              onPressed: () => context.push('/write'),
            ),
            Expanded(
              child: FirestoreListView<Memo>(
                query: _query(),
                    itemBuilder: (context, snapshot) {
                      final memo = snapshot.data();
                      return ListTile(
                        title: Text(memo.title),
                        subtitle: Text(memo.body),
                      );
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }
  //uid 일치할때 보는것(uid 추가해서 남들이 들어오면 안보임))
  Query<Memo> _query() {
    return FirebaseFirestore.instance
                  .collection('memos')
                  .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid ?? '')
                  .withConverter<Memo>(
                    fromFirestore: (snapshot, _) =>
                        Memo.fromJson(snapshot.data()!),
                    toFirestore: (movie, _) => movie.toJson(),
                  );
  }
}

//다른 사람도 볼 수 있는 것
// FirebaseFirestore.instance
//                     .collection('memos')
//                     .withConverter<Memo>(
//                       fromFirestore: (snapshot, _) =>
//                           Memo.fromJson(snapshot.data()!),
//                       toFirestore: (movie, _) => movie.toJson(),
//                     ),