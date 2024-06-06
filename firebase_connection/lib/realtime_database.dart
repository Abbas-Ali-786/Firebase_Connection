import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseApp extends StatefulWidget {
  @override
  _RealtimeDatabaseAppState createState() => _RealtimeDatabaseAppState();
}

class _RealtimeDatabaseAppState extends State<RealtimeDatabaseApp> {
  final databaseReference = FirebaseDatabase.instance.reference();
  String data = "Loading";

  @override
  void initState() {
    super.initState();
    // Listening for real-time updates
    databaseReference.child("example/data").onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null && value is Map) {
        setState(() {
          data = value['value'] ?? "No Data";
        });
      } else {
        setState(() {
          data = "No Data";
        });
      }
    });
  }


  void createRecord() {
    databaseReference.child("example/data").set({
      'value': "Hello World",
    });
  }


  void updateData() {
    databaseReference.child("example/data").update({
      'value': "Updated Hello World",
    });
  }


  void deleteData() {
    databaseReference.child("example/data").remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Database'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: createRecord,
              child: Text("Create Record"),
            ),
            ElevatedButton(
              onPressed: updateData,
              child: Text("Update Record"),
            ),
            ElevatedButton(
              onPressed: deleteData,
              child: Text("Delete Record"),
            ),
          ],
        ),
      ),
    );
  }
}