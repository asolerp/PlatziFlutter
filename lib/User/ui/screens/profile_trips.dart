import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_app/User/bloc/bloc_user.dart';
import 'package:platzi_app/User/model/user.dart';
import 'package:platzi_app/User/ui/screens/profile_header.dart';
import '../widgets/profile_places_list.dart';
import '../widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.done:

          default:

        }
      },
    );




  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if(!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return  Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            Text("Usuario no logeado. Haz login")
          ],
        ),
      ],
    );
    } else {
      print("Usuario logueado");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          imgProfile: snapshot.data.photoUrl
      );

      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(),
              ProfilePlacesList()
            ],
          )
        ],
      );

    }
  }
}