import 'package:flutter/material.dart';

class ErrorCenter extends StatelessWidget {
  final String error;
  ErrorCenter(this.error);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Se produjo un error $error",
        style: TextStyle(fontSize: 14, color: Colors.red),
      ),
    );
  }
}
