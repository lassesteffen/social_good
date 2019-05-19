import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:social_good/mainModel.dart' show AppModel;
import 'package:social_good/model/challenges.dart' show Challenge;
import 'package:social_good/widgets/challenge_card.dart' show ChallengeCard;

class Feed extends StatefulWidget {
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, appModel) {
        List<Widget> challengeCards = appModel.upcomingChallenges.map(
          (Challenge challenge) {
            return ChallengeCard(challenge, 'feed');
          },
        ).toList();

        return ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: challengeCards,
              ),
            )
          ],
        );
      },
    );
  }
}
