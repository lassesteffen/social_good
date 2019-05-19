import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_good/mainModel.dart'
  show AppModel;

import 'package:social_good/utils/url.dart' show openMap;

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    AppModel model = ScopedModel.of<AppModel>(context);
    List<ListTile> supportedProjectTiles = model.currentUser.supportedProjects.map((String projectTitle) {
      return ListTile(title: Text(projectTitle),);
    }).toList();

    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                model.currentUser.image,
                height: 280,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  child: Icon(Icons.edit),
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              '${model.currentUser.country}, ${model.currentUser.city}',
            ),
            subtitle: Text(model.currentUser.address),
            onTap: () {
              openMap(model.currentUser.address, model.currentUser.city, model.currentUser.country);
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
            title: Text('First aid'),
          ),
          ListTile(
            title: Text('Repairing electronic devices'),
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
            title: Text('Painter for my flat'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              'Supported Projects',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
              child: Column(
                children: supportedProjectTiles,
              ),
          )
        ],
      ),
    );
  }
}
