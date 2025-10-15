import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  // Singleton pattern
  FirebaseService._privateConstructor();
  static final FirebaseService instance = FirebaseService._privateConstructor();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential> signIn(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createUser(String email, String password) {
    return auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() => auth.signOut();

  CollectionReference usersCollection() => firestore.collection("users");

  CollectionReference taskCollection() => firestore.collection("tasks");

}