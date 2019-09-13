import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_app/User/repository/firebase_auth_api.dart';

class AuthRepository {

  final _firebasAuthPI = FirebaseAuthAPI();

  Future<FirebaseUser> sigInFirebase() => _firebasAuthPI.signIn();
  signOut() => _firebasAuthPI.signOut();

}