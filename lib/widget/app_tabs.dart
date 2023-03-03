import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  final Color color;
  final String text;

  AppTab({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0, 0),
              blurRadius: 7,
            )
          ]),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
