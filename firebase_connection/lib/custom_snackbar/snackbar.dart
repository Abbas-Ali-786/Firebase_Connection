import 'package:flutter/material.dart';


class CustomSnackbar extends StatelessWidget {

  String text;

  CustomSnackbar({required this.text});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(text));
  }
}

