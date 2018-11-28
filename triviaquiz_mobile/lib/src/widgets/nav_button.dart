import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String text;

  NavButton(String text) : text = text;

  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 5.0),
      ),
    );
  }
}
