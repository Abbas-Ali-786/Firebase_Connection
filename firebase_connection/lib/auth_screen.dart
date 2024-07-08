import 'package:firebase_connection/firebase_otp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User signed in successfully");
      // Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(),));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User signed in successfully'),
      ));

      
    } on FirebaseAuthException catch (e) {
      print("Failed to sign in with Email & Password: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Email or Password incorrect'),
      ));
    }
  }


  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User registered successfully");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User registered successfully'),
      ));
    } on FirebaseAuthException catch (e) {
      print("Failed to register with Email & Password: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to register with Email & Password'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
