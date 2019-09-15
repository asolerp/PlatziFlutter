import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_app/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_app/User/model/user.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos - Stream
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  // Casos de uso

  //1.  SigIn a la app con google
  Future<FirebaseUser> signIn() {
    return _auth_repository.sigInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFireStoreRepository = CloudFireStoreRepository();
  void updateUserData(User user) => _cloudFireStoreRepository.updateUserDataFireStore(user);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}