import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_app/Place/model/place.dart';
import 'package:platzi_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_app/User/bloc/bloc_user.dart';
import 'package:platzi_app/widgets/button_purple.dart';
import 'package:platzi_app/widgets/gradient_back.dart';
import 'package:platzi_app/widgets/text_input.dart';
import 'package:platzi_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {

  File image;

  AddPlaceScreen({
    Key key,
    this.image
});

  @override
  State createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescription = TextEditingController();

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0),
          Row( // App Bar
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () {
                      Navigator.pop(context);                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                  child: TitleHeader(title: "Add a new Place",),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                      pathImage: "assets/img/beach_palm.jpeg",
                      iconData: Icons.camera_alt,
                      width: 350.0,
                      height: 250.0,
                      left: 0,
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescription,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hinText: "Add Location",
                    iconData: Icons.location_on,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: () {
                      userBloc.updatePlaceData(Place(
                        name: _controllerTitlePlace.text,
                        description: _controllerDescription.text,
                        likes: 0,
                      )).whenComplete(() {
                        print("TERMINO");
                        Navigator.pop(context);
                      });
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}