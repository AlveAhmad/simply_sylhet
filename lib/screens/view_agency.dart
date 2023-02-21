import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplysylhet/screens/agency_details.dart';
import 'package:simplysylhet/screens/home_screen.dart';
import 'package:simplysylhet/screens/page2_screen.dart';
import 'package:simplysylhet/widgets/home_bottom_bar.dart';

class BookNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 45),
                      child: Text(
                        ' Travel Agents',
                        style: GoogleFonts.signika(
                            color: Colors.black,
                            letterSpacing: 0,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 47, right: 30),
                  child: Text(
                    'Sort By',
                    style: GoogleFonts.lato(
                        color: Colors.grey[600],
                        letterSpacing: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgencyDetails(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0, // Move to right 10  horizontally
                            4, // Move to bottom 10 Vertically
                          ),
                        )
                      ]),
                  child: ListTile(
                    leading: Container(
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0),
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                        boxShadow: [
                          // BoxShadow(
                          //   color: Colors.grey,
                          //   blurRadius: 10.0, // soften the shadow
                          //   spreadRadius: 2.0, //extend the shadow
                          //   offset: Offset(
                          //     0, // Move to right 10  horizontally
                          //     4, // Move to bottom 10 Vertically
                          //   ),
                          // )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://img.freepik.com/free-vector/detailed-travel-logo_23-2148616611.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Travel Architecture',
                          style: GoogleFonts.signika(
                              color: Colors.black,
                              letterSpacing: 0,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 8),
                        Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Twitter_Verified_Badge.svg/1200px-Twitter_Verified_Badge.svg.png',
                            height: 16)
                      ],
                    ),
                    subtitle: Text('Rating : 4.5/5'),
                    trailing: Text(
                      'Dhaka',
                      style: GoogleFonts.signika(
                          color: Color.fromARGB(255, 16, 204, 119),
                          letterSpacing: 0,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    isThreeLine: false,
                  ),
                  padding: const EdgeInsets.only(top: 30),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0),
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          0, // Move to right 10  horizontally
                          4, // Move to bottom 10 Vertically
                        ),
                      )
                    ]),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      ),
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.grey,
                        //   blurRadius: 10.0, // soften the shadow
                        //   spreadRadius: 2.0, //extend the shadow
                        //   offset: Offset(
                        //     0, // Move to right 10  horizontally
                        //     4, // Move to bottom 10 Vertically
                        //   ),
                        // )
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://e7.pngegg.com/pngimages/791/242/png-clipart-world-travel-illustration-world-map-globe-travel-global-travel-logo-computer-wallpaper.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        'The Rio',
                        style: GoogleFonts.signika(
                            color: Colors.black,
                            letterSpacing: 0,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 5),
                      Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Twitter_Verified_Badge.svg/1200px-Twitter_Verified_Badge.svg.png',
                          height: 16)
                    ],
                  ),
                  subtitle: Text('Rating : 4.3/5'),
                  trailing: Text(
                    'Chittagong',
                    style: GoogleFonts.signika(
                        color: Color.fromARGB(255, 16, 204, 119),
                        letterSpacing: 0,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  isThreeLine: false,
                ),
                padding: const EdgeInsets.only(top: 30),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(15.0),
                      bottomRight: const Radius.circular(15.0),
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          0, // Move to right 10  horizontally
                          4, // Move to bottom 10 Vertically
                        ),
                      )
                    ]),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      ),
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.grey,
                        //   blurRadius: 10.0, // soften the shadow
                        //   spreadRadius: 2.0, //extend the shadow
                        //   offset: Offset(
                        //     0, // Move to right 10  horizontally
                        //     4, // Move to bottom 10 Vertically
                        //   ),
                        // )
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.dribbble.com/users/113499/screenshots/11939156/media/2484c70ccffecc98651499aa7422abbb.png?compress=1&resize=400x300'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        'The Blue ',
                        style: GoogleFonts.signika(
                            color: Colors.black,
                            letterSpacing: 0,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 5),
                      Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Twitter_Verified_Badge.svg/1200px-Twitter_Verified_Badge.svg.png',
                          height: 16)
                    ],
                  ),
                  subtitle: Text('Rating : 4.1/5'),
                  trailing: Text(
                    'Dhaka',
                    style: GoogleFonts.signika(
                        color: Color.fromARGB(255, 16, 204, 119),
                        letterSpacing: 0,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  isThreeLine: false,
                ),
                padding: const EdgeInsets.only(top: 30),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colors.white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black26,
                  //           blurRadius: 4,
                  //         )
                  //       ]),
                  //   child: Icon(Icons.bookmark_outline, size: 40),
                  // ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen2(),
                          ));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 16, 204, 119),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        "View More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
