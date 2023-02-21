import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplysylhet/widgets/post_app_bar.dart';
import 'package:simplysylhet/widgets/post_bottomm_bar.dart';
import '../services/auth.dart';
import '../services/validator.dart';

class PostScreen extends StatefulWidget {
  final User user;
  final String image;
  final String name;
  final String rating;

  PostScreen({
    required this.user,
    required this.name,
    required this.image,
    required this.rating,
  });

  @override
  _PostScreenState createState() => _PostScreenState(image, name, rating);
}

class _PostScreenState extends State<PostScreen> {
  late User _currentUser;
  final String image;
  final String name;
  final String rating;

  _PostScreenState(this.image, this.name, this.rating);

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(
            user: _currentUser,
          ),
        ),
        bottomNavigationBar: PostBottomBar(name, rating),
      ),
    );
  }
}
