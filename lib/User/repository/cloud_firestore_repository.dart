import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_app/User/model/user.dart';
import 'package:platzi_app/User/repository/cloud_firestore_api.dart';

class CloudFireStoreRepository {
  
  final _cloudFireSotreAPI = CloudFireStoreAPI();
  
  void updateUserDataFireStore(User user) => _cloudFireSotreAPI.updateUserData(user);
  
}