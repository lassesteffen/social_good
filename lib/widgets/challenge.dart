import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:social_good/utils/url.dart' show openMap;

class ChallengeCard extends StatelessWidget {
  var challenge;
  ChallengeCard({this.challenge});
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: CircleAvatar(),
          )
        ],
      ),
    )
  }
}

var challenge = {
  'title': 'Jump in lake',
  'description': 'blablabla',
  'raisedAmount': 100,
  'contestant': {
    'profileImage': 'assets/profile.jpeg',
    'name': 'Paul',
  },
};



class ChallengeCardState extends State<ChallengeCard> {
  String profileImage = 'assets/profi le.jpeg';

  Widget build(BuildContext context) {
    final address = 'Sinini St';
    final city = 'Harare';
    final country = 'Zimbabwe';

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
            title: Text(
              '$country, $city',
            ),
            subtitle: Text(address),
            onTap: () {
              openMap(address, city, country);
            },
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
