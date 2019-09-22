import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_app/Place/model/place.dart';
import 'package:platzi_app/User/model/user.dart';
import 'package:platzi_app/User/repository/cloud_firestore_api.dart';

class CloudFireStoreRepository {

  final _cloudFireStoreAPI = CloudFireStoreAPI();

  void updateUserDataFireStore(User user) =>
      _cloudFireStoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFireStoreAPI.updatePlaceData(place);

}