import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:social_good/mainModel.dart' show AppModel;
import 'package:social_good/model/challenges.dart' show Challenge, Supporter;
import 'package:social_good/model/projects.dart' show Project;
import 'package:social_good/widgets/challenge_summary.dart'
    show ChallengeSummary;
import 'package:social_good/ui/common/separator.dart';
import 'package:social_good/ui/text_style.dart';

class DetailPage extends StatefulWidget {
  final Challenge challenge;
  final String pageId;
  DetailPage({Key key, this.challenge, this.pageId}) : super(key: key);
  DetailPageState createState() => DetailPageState(challenge, pageId);
}

class DetailPageState extends State<DetailPage> {
  final Challenge challenge;
  final String pageId;
  TextEditingController _amountController = TextEditingController();
  String _selectedProjectId;

  DetailPageState(this.challenge, this.pageId);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, appModel) {
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
            ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          color: Theme.of(context).accentColor,
          child: Stack(
            children: <Widget>[
              _getBackground(),
              _getGradient(context),
              _getContent(),
            ],
          ),
        ),
        persistentFooterButtons: [
          _getPersistentFooterButton(appModel),
        ],
      );
    });
  }

  void _showCompleteDialog(BuildContext context) {
    return null;
  }

  void _showAlertDialog(BuildContext context) {
    AppModel model = ScopedModel.of<AppModel>(context);
    List<Project> projects = model.currentUser.supportedProjects;
    _amountController = TextEditingController();
    _selectedProjectId = projects[0].id;
    List<Widget> projectWidgets = projects.map((Project project) {
      return RadioListTile(
        groupValue: _selectedProjectId,
        title: Text(project.name),
        value: project.id,
        onChanged: (val) {
          setState(() {
            _selectedProjectId = val;
          });
        },
      );
    }).toList();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Support ${challenge.contestant.name}s challenge'),
            content: Column(
              children: <Widget>[
                Text('1. Select a project to which you want to donate.'),
                ...projectWidgets,
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                    '2. Select the amount to support ${challenge.contestant.name}s challenge with.'),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(hintText: 'Amount in USD'),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Support'),
                onPressed: () {
                  model.supportChallenge(
                    challenge.id,
                    double.parse(_amountController.text),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget _getPersistentFooterButton(AppModel appModel) {
    IconData icon = Icons.play_arrow;
    String buttonText = '';
    var buttonFunction;
    RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    );

    if (challenge.contestant == appModel.currentUser) {
      if (challenge.finishedAt != null) {
        buttonText = 'Finished';
        icon = Icons.check;
      } else {
        buttonText = 'Finish this Challenge';
        buttonFunction = () => _showCompleteDialog(context);
      }
    } else {
      if (challenge.supporters
          .map((Supporter supporter) => supporter.user)
          .contains(appModel.currentUser)) {
        buttonText = 'You are a Supporter';
        icon = Icons.check;
      } else {
        buttonText = 'Support now';
        icon = Icons.attach_money;
        buttonFunction = () => _showAlertDialog(context);
      }
    }
    return FlatButton(
      child: Row(
        children: <Widget>[
          Text(buttonText),
          Icon(icon),
        ],
      ),
      onPressed: buttonFunction,
    );
  }

  Container _getBackground() {
    return Container(
      child: Image.asset(
        challenge.contestant.image,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Colors.white,
            Theme.of(context).accentColor,
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          ChallengeSummary(
            challenge,
            pageId,
            horizontal: false,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                Separator(),
                Text(
                  challenge.description,
                  style: Style.commonTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
