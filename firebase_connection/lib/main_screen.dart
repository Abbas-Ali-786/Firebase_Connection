import 'package:firebase_connection/auth_screen.dart';
import 'package:firebase_connection/firebase_otp.dart';
import 'package:firebase_connection/realtime_database.dart';
import 'package:flutter/material.dart';

import 'cloud_firestore_database.dart';
import 'firebase_storage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '"Firebase Connections"',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen(),)); },
                child: const Text('Firebase Auth')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(),)); },
                child: const Text('Firebase OTP')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CloudFirestore(),)); },
                child: const Text('Cloud Firestore Database')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),)); },
                child: const Text('Firebase Storage')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => RealtimeDatabaseApp(),)); },
                child: const Text('RealTime Database')),
          ],
        ),
      ),
    );
  }
}
