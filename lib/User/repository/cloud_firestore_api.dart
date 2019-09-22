import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_app/Place/model/place.dart';
import 'package:platzi_app/User/model/user.dart';

class CloudFireStoreAPI {

  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {

    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'imgProfile': user.imgProfile,
      'myPlaces': user.myPlaces,
      'myFovoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()

    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlces = _db.collection(PLACES);

    await _auth.currentUser().then((FirebaseUser user) {
       refPlces.add({
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        'userOwner': "${USERS}/${user.uid}"
      });
    });


  }

}