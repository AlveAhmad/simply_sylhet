import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/register.dart';
import '../services/auth.dart';
import '../services/validator.dart';
import 'package:flutter/material.dart';
import 'package:simplysylhet/models/firebaseuser.dart';
import 'package:simplysylhet/screens/logout.dart';
import 'package:simplysylhet/screens/root_app.dart';

// class HomeAppBar extends StatefulWidget {
//    final User user;

//   HomeAppBar({required this.user});
//      @override
//   _HomeAppBar createState() => _HomeAppBar();
//     late User _currentUser;
// }
//   class _HomeAppBar extends State<HomeAppBar> {
//    @override
//   void initState() {
//     _currentUser = widget.user;
//     super.initState();
//   }
class HomeAppBar extends StatefulWidget {
  final User user;

  HomeAppBar({required this.user});

  @override
  _HomeAppBar createState() => _HomeAppBar();
}

class _HomeAppBar extends State<HomeAppBar> {
  var category = ['Best Places', 'Most Visited', 'Favourites'];
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => logout(user: _currentUser),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.logout_rounded,
                size: 28,
                color: Colors.red,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color(0xFFF65959),
              ),
              Text(
                "Sylhet, Bangladesh",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(user: _currentUser),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.person,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
