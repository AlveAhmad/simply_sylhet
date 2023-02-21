import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplysylhet/screens/login.dart';
import 'package:simplysylhet/screens/post_screen.dart';
import 'package:simplysylhet/widgets/home_app_bar.dart';
import 'package:simplysylhet/widgets/home_bottom_bar.dart';
import 'package:simplysylhet/widgets/post_app_bar.dart';
import '../screens/register.dart';
import '../services/auth.dart';

class logout extends StatefulWidget {
  final User user;

  logout({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<logout> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(
            user: _currentUser,
          ),
        ),

        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(90.0),
        //   child: HomeAppBar(),
        // ),
        body: WillPopScope(
          onWillPop: () async {
            final logout = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: new Text('Are you sure?'),
                  content: new Text('Do you want to logout from this App'),
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Logout();
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('No'),
                    ),
                  ],
                );
              },
            );
            return logout!;
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '  Hey ${_currentUser.displayName} ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                // SizedBox(height: 16.0),
                // Text(
                //   'EMAIL: ${_currentUser.email}',
                //   style: Theme.of(context).textTheme.bodyText1,
                // ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign out'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<dynamic> Logout() async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
