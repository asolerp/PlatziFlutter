import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_app/User/bloc/bloc_user.dart';
import 'profile_place.dart';
import '../../../Place/model/place.dart';

class ProfilePlacesList extends StatelessWidget {

  UserBloc userBloc;

  // Place place = new Place('Knuckles Mountains Range', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '123,123,123');
  // Place place2 = new Place('Mountains', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '321,321,321');

  Place place = new Place(
      name: "Knuckles Mountains Range",
      description: "Hiking. Water fall hungint. Natural bath",
      urlImage: "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 3
  );

  Place place2 = new Place(
      name: "Mountains",
      description: "Hiking. Water fall hungint. Natural bath",
      urlImage: "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 3
  );
  
  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return Column(
                children: userBloc.builPlaces(snapshot.data.documents)
              );
            case ConnectionState.active:
              return Column(
                  children: userBloc.builPlaces(snapshot.data.documents)
              );
            case ConnectionState.none:
              return CircularProgressIndicator();
            default:
              return Column(
                  children: userBloc.builPlaces(snapshot.data.documents)
              );
          }
        }
      )
    );
  }

  /*
  Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      )
   */

}