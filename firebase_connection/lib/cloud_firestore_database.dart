import 'package:firebase_connection/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore extends StatefulWidget {
  @override
  State<CloudFirestore> createState() => _CloudFirestoreState();
}

class _CloudFirestoreState extends State<CloudFirestore> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addData() async{
    try {
      await firestore.collection('users').add({
        'name': 'Abbas Ali',
        'age': 24,
      });

        print('Data posted');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data posted'),
      ));
      } catch (e) {
        print('Data not posted: $e');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Data not posted'),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  addData();
                },
                child: const Text('Add Data to Firestore'),
              ),
          ],
        ),
      ),
    );
  }
}
