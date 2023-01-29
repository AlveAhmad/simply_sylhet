import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/place2.jpg'),
        fit: BoxFit.cover,
        opacity: 0.7,
      )),
    );
  }
}
