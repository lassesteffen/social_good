import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_good/mainModel.dart' show AppModel;
import 'package:social_good/widgets/challenge_card.dart' show ChallengeCard;
import 'package:social_good/model/challenges.dart' show Challenge;

class History extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, appModel) {
        List<Widget> openChallengedWidgets = appModel.challenges
            .map((Challenge challenge) => ChallengeCard(challenge, 'history'))
            .toList();

        return Container(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children: openChallengedWidgets,
          ),
        );
      },
    );
  }
}
