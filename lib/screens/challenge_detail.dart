import 'package:flutter/material.dart';
import 'package:social_good/model/challenges.dart';
import 'package:social_good/widgets/challenge_summary.dart'
    show ChallengeSummary;
import 'package:social_good/ui/common/separator.dart';
import 'package:social_good/ui/text_style.dart';

class DetailPage extends StatelessWidget {
  final Challenge challenge;
  final String pageId;

  DetailPage(this.challenge, this.pageId);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Theme.of(context).accentColor,
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(context),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.asset(
        challenge.contestant.image,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
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
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new ChallengeSummary(
            challenge,
            pageId,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(
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
