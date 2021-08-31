import 'package:firebase_auth/firebase_auth.dart';
import 'package:maxfit/domain/person.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Person?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return Person.fromFirebase(user);
    } on FirebaseException catch (error) {
      print(error);
      return null;
    }
  }

  Future<Person?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return Person.fromFirebase(user);
    } on FirebaseException catch (error) {
      print(error);
      return null;
    }
  }

  Future logOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<Person?> get currentUser {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => user != null ? Person.fromFirebase(user) : null);
  }
}
