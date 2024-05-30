import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addData() {
    return firestore.collection('users').add({
      'name': 'Abbas Ali',
      'age': 30,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            addData();
          },
          child: Text('Add Data to Firestore'),
        ),
      ),
    );
  }
}
