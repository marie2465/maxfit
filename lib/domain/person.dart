import 'package:firebase_auth/firebase_auth.dart';

class Person{
  String? id='';

  Person.fromFirebase(User? user){
    id = user!.uid;
  }
}