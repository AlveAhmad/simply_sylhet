import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplysylhet/screens/home.dart';
import 'package:simplysylhet/screens/home_screen.dart';
import 'package:simplysylhet/screens/post_screen.dart';

class PostAppBar extends StatefulWidget {
  final User user;

  PostAppBar({required this.user});

  @override
  _PostAppBarState createState() => _PostAppBarState();
}

class _PostAppBarState extends State<PostAppBar> {
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
                    builder: (context) => HomeScreen(
                      user: _currentUser,
                    ),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.white, blurRadius: 6)]),
              child: Icon(
                Icons.arrow_back,
                size: 28,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 6),
                ],
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
