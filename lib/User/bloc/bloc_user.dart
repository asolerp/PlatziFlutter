import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_app/Place/model/place.dart';
import 'package:platzi_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_app/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_app/User/model/user.dart';
import 'package:platzi_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos - Stream
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();
  // Casos de uso

  //1.  SigIn a la app con google
  Future<FirebaseUser> signIn() => _auth_repository.sigInFirebase();

  //2. Registrar usuario en base de datos
  final _cloudFireStoreRepository = CloudFireStoreRepository();

  void updateUserData(User user) => _cloudFireStoreRepository.updateUserDataFireStore(user);
  Future<void> updatePlaceData(Place place) => _cloudFireStoreRepository.updatePlaceData(place);

  Stream<QuerySnapshot> placesListStream = Firestore.instance.collection(CloudFireStoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
  List<ProfilePlace> builPlaces(List<DocumentSnapshot> placeListSnapshot) => _cloudFireStoreRepository.bildPlaces(placeListSnapshot);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);


  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}