import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: Center(
        child: ElevatedButton(child: const Text('log out') ,onPressed: () {
          FirebaseAuth.instance.signOut();
        },),
      ),
    );
  }
}