// import 'package:firebase_auth/firebase_auth.dart';

// class auth {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> registerWithEmailAndPassword(
//       String email, String password) async {
//     await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//   }

//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       final user = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       var errorMessage = " ";
//     } on FirebaseAuthException catch (e) {}
//   }
// }