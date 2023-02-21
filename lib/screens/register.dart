import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// class MyRegister extends StatefulWidget {
//   const MyRegister({super.key});

//   @override
//   State<MyRegister> createState() => _MyRegisterState();
// }

// class _MyRegisterState extends State<MyRegister> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('images/register.jpeg'), fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 150),
//               child: Text(
//                 'Create Account',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * .35,
//                   right: 35,
//                   left: 35),
//               child: Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 10),
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: '\t \t First Name',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25))),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 10),
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: '\t \t Last Name',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25))),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 10),
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: '\t \t Email',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25))),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 10),
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: '\t \t Password',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25))),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Sign Up',
//                         style: TextStyle(
//                             color: Color(0xff4c505b),
//                             fontSize: 27,
//                             fontWeight: FontWeight.w700),
//                       ),
//                       CircleAvatar(
//                         radius: 40,
//                         backgroundColor: Color(0xff4c505b),
//                         child: IconButton(
//                           color: Colors.white,
//                           onPressed: () {},
//                           icon: Icon(Icons.arrow_forward),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 1,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, 'register');
//                           },
//                           child: Text(
//                             'Sign In',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xff4c505b),
//                             ),
//                           )),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:simplysylhet/screens/home.dart';
import '../screens/home_screen.dart';
import '../services/auth.dart';
import '../services/validator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 16, 204, 119),
          title: Text('Create Account'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset("images/sji.png"),
                ),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Name",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 16, 204, 119),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 16, 204, 119),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      TextFormField(
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password",
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 16, 204, 119),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.0),
                      _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        _isProcessing = true;
                                      });

                                      if (_registerFormKey.currentState!
                                          .validate()) {
                                        User? user = await FirebaseAuthHelper
                                            .registerUsingEmailPassword(
                                          name: _nameTextController.text,
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text,
                                        );

                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        if (user != null) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(user: user),
                                            ),
                                            ModalRoute.withName('/'),
                                          );
                                        }
                                      } else {
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                      }
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 10.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0)),
                                        backgroundColor:
                                            Color.fromARGB(255, 16, 204, 119)),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
