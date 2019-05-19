import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_good/mainModel.dart'
  show AppModel;
import 'package:social_good/model/projects.dart' show projectMocks, Project;

import 'package:social_good/utils/url.dart' show openMap;

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    AppModel model = ScopedModel.of<AppModel>(context);
    List<ListTile> supportedProjectTiles = model.currentUser.supportedProjects.map((Project p) {
      return ListTile(title: Text(p.name), leading: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(p.image)
                        )
                    )),);
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
