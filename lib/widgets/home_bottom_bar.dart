import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/root_app.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 2,
      items: [
        IconButton(
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () {
            // ...
          },
        ),
        // Icon(Icons.person_outline, size: 30),
        Icon(Icons.favorite_outline, size: 30),
        IconButton(
          icon: const Icon(
            Icons.home,
            size: 30,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'HP');
            // ...
          },
        ),
        // Icon(
        //   Icons.home,
        //   size: 30,
        //   color: Colors.redAccent,
        // ),
        Icon(Icons.location_city_outlined, size: 30),
        Icon(Icons.list, size: 30),
      ],
      //    onTap: (index) {
      //     setState(() {
      //           _page = index;
      //         });
      //   //Handle button tap
      // },
    );
  }
}
