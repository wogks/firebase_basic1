import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_why1/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
      return const SignInScreen(
        providerConfigs: [
          EmailProviderConfiguration()
        ]
      );
    }
    return const MainScreen();
      },
    );
  }
  }
