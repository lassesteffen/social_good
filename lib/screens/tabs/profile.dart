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
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('\$12'),
            subtitle: Text('Balance'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            title: Text('14 (3 Supports, \$18)'),
            subtitle: Text('Supporter Rank'),
          ),
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            title: Text('2 (7 Challenges, \$73)'),
            subtitle: Text('Challenger Rank'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.store),
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
