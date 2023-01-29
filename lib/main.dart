import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simplysylhet/screens/home_screen.dart';
import 'package:simplysylhet/screens/login.dart';
import 'package:simplysylhet/screens/page2_screen.dart';
import 'package:simplysylhet/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        scaffoldBackgroundColor: Color(0xFFEDF2F6),
      ),
      home: HomeScreen(),
      routes: {
        'login': (context) => SecondPage(),
        'register': (context) => MyRegister()
      },
    );
  }
}
