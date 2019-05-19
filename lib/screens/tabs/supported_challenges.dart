import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_good/mainModel.dart' show AppModel;
import 'package:social_good/widgets/challenge_card.dart' show ChallengeCard;
import 'package:social_good/model/challenges.dart' show Challenge;

class MySupportedChallenges extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, appModel) {
        List<Widget> myOpenChallengeWidgets = appModel
            .myActiveSupportedChallenges
            .map((Challenge challenge) => ChallengeCard(challenge, 'others'))
            .toList();

        List<Widget> myCompletedChallengeWidgets = appModel
            .myCompletedSupportedChallenges
            .map((Challenge challenge) => ChallengeCard(challenge, 'others'))
            .toList();

        return Container(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children: [
              ...myOpenChallengeWidgets,
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Completed Challenges',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                alignment: Alignment.center,
              ),
              ...myCompletedChallengeWidgets,
            ],
          ),
        );
      },
    );
  }
}
