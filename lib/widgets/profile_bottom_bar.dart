import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/root_app.dart';

class ProfileBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 0,
      items: [
        IconButton(
          icon: const Icon(
            Icons.person,
            size: 30,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'PP');
            // ...
          },
        ),
        // Icon(Icons.person_outline, size: 30),
        Icon(Icons.favorite_outline, size: 30),
        Icon(
          Icons.home,
          size: 30,
        ),
        Icon(Icons.search, size: 30),
        Icon(Icons.location_city_outlined, size: 30),
      ],
    );
  }
}
