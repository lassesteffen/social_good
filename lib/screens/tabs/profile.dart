import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  String profileImage = 'assets/profile.jpeg';

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                profileImage,
                height: 280,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  child: Icon(Icons.edit),
                  onPressed: () {
                    _takePicture(context);
                  },
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Africa, Simbabwe'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              'Skills',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          ListTile(
            title: Text('Skill 1'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              'Needs',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          ListTile(
            title: Text('Need 1'),
          ),
        ],
      ),
    );
  }

  _takePicture(BuildContext context) async {
    File cameraFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      profileImage = cameraFile.path;
    });
  }
}
