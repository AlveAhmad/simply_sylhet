import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplysylhet/screens/home.dart';
import '../screens/home_screen.dart';
import '../screens/register.dart';

import '../services/auth.dart';
import '../services/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 125, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset("images/sji.png"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40.0, top: 20),
                      child: Text('Simply Sylhet!',
                          style: TextStyle(
                            color: Color.fromARGB(255, 16, 204, 119),
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
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
                                  color: Colors.red,
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
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.0),
                          _isProcessing
                              ? CircularProgressIndicator()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          _focusEmail.unfocus();
                                          _focusPassword.unfocus();

                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _isProcessing = true;
                                            });

                                            User? user =
                                                await FirebaseAuthHelper
                                                    .signInUsingEmailPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text,
                                            );

                                            setState(() {
                                              _isProcessing = false;
                                            });

                                            if (user != null) {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen(user: user),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 30.0,
                                                vertical: 10.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25.0)),
                                            backgroundColor: Color.fromARGB(
                                                255, 16, 204, 119)),
                                      ),
                                    ),
                                    SizedBox(width: 24.0),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'SignUp',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 30.0,
                                                vertical: 10.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25.0)),
                                            backgroundColor: Color.fromARGB(
                                                255, 16, 204, 119)),
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

 
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:simplysylhet/models/loginuser.dart';

// import '../services/auth.dart';

// // AuthService _auth = AuthService();
// // dynamic result = await _auth.signInEmailPassword(LoginUser(email: _email.text,password: _password.text));
// //               if (result.uid == null) { //null means unsuccessfull authentication
// //                 showDialog(
// //                     context: context,
// //                     builder: (context) {
// //                       return AlertDialog(
// //                         content: Text(result.code),
// //                       );
// //                     });
// //           }

// class Login extends StatefulWidget {
//   final Function? toggleView;
//   Login({this.toggleView});

//   @override
//   State<StatefulWidget> createState() {
//     return _Login();
//   }
// }

// class _Login extends State<Login> {
//   bool _obscureText = true;

//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     final emailField = TextFormField(
//         controller: _email,
//         autofocus: false,
//         validator: (value) {
//           if (value != null) {
//             if (value.contains('@') && value.endsWith('.com')) {
//               return null;
//             }
//             return 'Enter a Valid Email Address';
//           }
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Email",
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

//     final passwordField = TextFormField(
//         obscureText: _obscureText,
//         controller: _password,
//         autofocus: false,
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return 'This field is required';
//           }
//           if (value.trim().length < 8) {
//             return 'Password must be at least 8 characters in length';
//           }
//           // Return null if the entered password is valid
//           return null;
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Password",
//             suffixIcon: IconButton(
//               icon:
//                   Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
//               onPressed: () {
//                 setState(() {
//                   _obscureText = !_obscureText;
//                 });
//               },
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(32.0),
//             )));

//     final txtbutton = TextButton(
//         onPressed: () {
//           widget.toggleView!();
//         },
//         child: const Text('New? Register here'));

//     final loginAnonymousButon = Material(
//       elevation: 5.0,
//       borderRadius: BorderRadius.circular(30.0),
//       color: Theme.of(context).primaryColor,
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         onPressed: () async {
//           dynamic result = await _auth.signInAnonymous();

//           if (result.uid == null) {
//             //null means unsuccessfull authentication
//             showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     content: Text(result.code),
//                   );
//                 });
//           }
//         },
//         child: Text(
//           "Log in Anonymously",
//           style: TextStyle(color: Theme.of(context).primaryColorLight),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );

//     final loginEmailPasswordButon = Material(
//       elevation: 5.0,
//       borderRadius: BorderRadius.circular(30.0),
//       color: Theme.of(context).primaryColor,
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         onPressed: () async {
//           if (_formKey.currentState!.validate()) {
//             dynamic result = await _auth.signInEmailPassword(
//                 LoginUser(email: _email.text, password: _password.text));
//             if (result.uid == null) {
//               //null means unsuccessfull authentication
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text(result.code),
//                     );
//                   });
//             }
//           }
//         },
//         child: Text(
//           "Log in",
//           style: TextStyle(color: Theme.of(context).primaryColorLight),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Login Demo Page'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Form(
//             key: _formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   loginAnonymousButon,
//                   const SizedBox(height: 45.0),
//                   emailField,
//                   const SizedBox(height: 25.0),
//                   passwordField,
//                   txtbutton,
//                   const SizedBox(height: 35.0),
//                   loginEmailPasswordButon,
//                   const SizedBox(height: 15.0),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
