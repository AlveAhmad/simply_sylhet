// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/loginuser.dart';
// import '../models/FirebaseUser.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;


//   FirebaseUser? _firebaseUser(User? user) {
//     return user != null ? FirebaseUser(uid: user.uid) : null;
//   }


//   Stream<FirebaseUser?> get user {
//     return _auth.authStateChanges().map(_firebaseUser);
//   }


//   Future signInAnonymous() async {
//     try {
//       UserCredential userCredential = await _auth.signInAnonymously();
//       User? user = userCredential.user;
//       return _firebaseUser(user);
//     } catch (e) {
//      return FirebaseUser(code: e.toString(), uid: null);
//     }
//   }


//   Future signInEmailPassword(LoginUser _login) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: _login.email.toString(),
//               password: _login.password.toString());
//       User? user = userCredential.user;
//       return _firebaseUser(user);
//     } on FirebaseAuthException catch (e) {
//       return FirebaseUser(code: e.code, uid: null);
//     }
//   }


//   Future registerEmailPassword(LoginUser _login) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _login.email.toString(),
//               password: _login.password.toString());
//       User? user = userCredential.user;
//       return _firebaseUser(user);
//     } on FirebaseAuthException catch (e) {
//       return FirebaseUser(code: e.code, uid: null);
//     } catch (e) {
//       return FirebaseUser(code: e.toString(), uid: null);
//     }
//   }


//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       return null;
//     }
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {

static Future<User?> registerUsingEmailPassword({
  required String name,
  required String email,
  required String password,
}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = userCredential.user;
    await user!.updateProfile(displayName: name);
    await user.reload();
    user = auth.currentUser;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

  return user;
}

 


static Future<User?> signInUsingEmailPassword({
  required String email,
  required String password,
}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    }
  }

  return user;
}

}