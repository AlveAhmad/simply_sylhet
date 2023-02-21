import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplysylhet/screens/login.dart';
import 'package:simplysylhet/screens/post_screen.dart';
import 'package:simplysylhet/utilis/data.dart';
import 'package:simplysylhet/widgets/home_app_bar.dart';
import 'package:simplysylhet/widgets/home_bottom_bar.dart';
import '../screens/register.dart';
import '../services/auth.dart';
import '../services/validator.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var category = ['Best Places', 'Most Visited', 'Favourites'];
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(user: _currentUser),
      ),

      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PostScreen(
                                              user: _currentUser,
                                              image:
                                                  "images/place${index + 1}.jpg",
                                              name: cities[index + 1],
                                              rating: rating[index + 1],
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 160,
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.only(left: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "images/place${index + 1}.jpg"),
                                          fit: BoxFit.cover,
                                          opacity: 0.7,
                                        ),
                                      ),
                                      child: Column(children: [
                                        Container(
                                          alignment: Alignment.topRight,
                                          child: Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(cities[index + 1],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ),
                                      ]),
                                    ),
                                  );
                                })),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(children: [
                        for (int i = 0; i < 3; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.only(
                                right: 20, left: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 16, 204, 119),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 4,
                                  ),
                                ]),
                            child: Text(
                              category[i],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostScreen(
                                          user: _currentUser,
                                          image: "images/place${index + 1}.jpg",
                                          name: cities[index + 1],
                                          rating: rating[index + 1],
                                        ),
                                      ));
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "images/place${index + 1}.jpg"),
                                        fit: BoxFit.cover,
                                        opacity: 0.8,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cities[index + 1],
                                        // cities${index + 1},
                                        // "City Name",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Icon(Icons.more_vert, size: 30),
                                    ]),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Text(
                                    rating[index + 1],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: HomeBottomBar(),

//     body: WillPopScope(
//       onWillPop: () async {
//         final logout = await showDialog<bool>(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: new Text('Are you sure?'),
//               content: new Text('Do you want to logout from this App'),
//               actionsAlignment: MainAxisAlignment.spaceBetween,
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Logout();
//                   },
//                   child: const Text('Yes'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context, false);
//                   },
//                   child: const Text('No'),
//                 ),
//               ],
//             );
//           },
//         );
//         return logout!;
//       },
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'NAME: ${_currentUser.displayName}',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'EMAIL: ${_currentUser.email}',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();

//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => LoginScreen(),
//                   ),
//                 );
//               },
//               child: const Text('Sign out'),
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.redAccent),
//               ),
//             ),
//           ],
//         ),
//       ),
//     )

//   );
// }

// Future<dynamic> Logout() async {

//   await FirebaseAuth.instance.signOut();

//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(
//       builder: (context) => LoginScreen(),
//     ),
    );
  }
}
