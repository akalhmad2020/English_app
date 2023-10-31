import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  const Sections({
    required this.icon,
    required this.titel,
  });

  final String titel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2F2F42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,

            child: Icon(
              icon,
              color: Colors.amber,
              size: 50,
            ),
          ),
          Text(titel, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
