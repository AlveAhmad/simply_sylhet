import 'dart:ui';

import 'package:flutter/material.dart';

class AgencyDetails extends StatelessWidget {
  static final String path = "lib/src/pages/hotel/details.dart";
  final String image = "images/agency.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 420,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Travel Architect",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "4.0/85 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border, size: 30),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.amberAccent,
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.grey,
                                    )),
                                    TextSpan(text: "Loacted in Dhaka")
                                  ]),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "\৳ 2000",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 16, 204, 119),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.0),
                              ),
                              Text(
                                "/per person",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        "Description".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            // mainAxisAlignment: ,
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: 660.0, bottom: 20, left: 18, right: 18),

                // child: Text(
                //   "Description".toUpperCase(),
                //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 145, 233, 148),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.wifi, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 158, 228, 221),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.ac_unit_rounded, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 214, 167),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.restaurant, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 145, 233, 148),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.car_rental, size: 40),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 114, 195, 233),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.pool, size: 40),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 16, 204, 119),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  "Book Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
