import 'users.dart';

class Supporter {
  final User user;
  final double amount;

  const Supporter(
    this.user,
    this.amount,
  );
}

class Challenge {
  final String id;
  final String title;
  final String distance;
  final String description;
  final List<String> tags;
  final User contestant;
  List<Supporter> supporters;
  String proof;
  final int fundingGoal;
  double get raisedAmount {
    if (supporters.isEmpty) {
      return 0.0;
    }
    var supporterAmount = supporters.map((s) => s.amount);

    return supporterAmount.reduce((sum, amount) => sum + amount);
  }

  final DateTime createdAt;
  DateTime finishedAt;

  Challenge({
    this.id,
    this.title,
    this.tags,
    this.contestant,
    this.supporters,
    this.distance,
    this.fundingGoal,
    this.description,
    this.createdAt,
    this.finishedAt,
    this.proof,
  });
}

List<Challenge> challengeMocks = [
  Challenge(
      id: '123',
      title: 'I will wash my neighbor\'s car',
      distance: 'Nearby',
      description:
          'My neighbor uses his car every day and it is very dirty. It needs to be washed. The problem is, he does not have time to do this, because he must take care about his three children and has no time to do the washing.',
      fundingGoal: 10,
      supporters: [
        Supporter(userMocks[4], 4),
        Supporter(userMocks[2], 1),
      ],
      contestant: userMocks[3],
      tags: ['society']),
  Challenge(
      id: '124',
      title: 'I will eat 2 kg of celery',
      distance: '3 km from you',
      description: 'Why not? ;)',
      fundingGoal: 20,
      supporters: [
        Supporter(userMocks[0], 5),
      ],
      contestant: userMocks[1],
      tags: ['food', 'funny', 'crazy']),
  Challenge(
      id: '126',
      title: 'I will clean the sidewalk',
      distance: 'Nearby',
      description: 'Because it is DIRTY',
      fundingGoal: 5,
      contestant: userMocks[0],
      supporters: [
        Supporter(userMocks[1], 2),
        Supporter(userMocks[2], 1),
      ],
      tags: [
        'society',
        'voluntary'
      ]),
  Challenge(
      id: '1211',
      title: 'I will annoy my neighbours',
      distance: 'Directly next to you',
      description:
          'My neighbours are very understanding people and will totally be ok with me annyoing them for charity!',
      fundingGoal: 5,
      contestant: userMocks[4],
      supporters: [
        Supporter(userMocks[1], 1),
        Supporter(userMocks[3], 1),
      ],
      tags: [
        'funny',
        'unnecessary',
        'weird'
      ]),
  Challenge(
      id: 'amkaud',
      title: 'I will help out at the soup kitchen',
      distance: 'Berlin, 15km from you',
      description:
          'I work in a local supermarket and get some food cheaper or for free, so I want to donate some food to the soup kitchen.',
      fundingGoal: 10,
      contestant: userMocks[3],
      supporters: [Supporter(userMocks[1], 10)],
      finishedAt: DateTime.now(),
      tags: ['voluntary', 'food', 'helping']),
  Challenge(
      id: 'aaaa',
      title: 'I will give out Free Hugs',
      distance: 'Nearby',
      description: 'Becasue everyone needs a hug',
      fundingGoal: 15,
      contestant: userMocks[4],
      supporters: [
        Supporter(userMocks[2], 1),
        Supporter(userMocks[0], 3),
        Supporter(userMocks[3], 11)
      ],
      finishedAt: DateTime.now(),
      tags: ['friendship']),
  Challenge(
      id: '12bbbb4',
      title: 'I will embarass myself in public',
      distance: 'Nearby',
      description: 'this is awesome',
      fundingGoal: 20,
      contestant: userMocks[3],
      supporters: [
        Supporter(userMocks[4], 2),
        Supporter(userMocks[0], 5),
        Supporter(userMocks[1], 10),
      ],
      tags: [
        'funny',
        'crazy'
      ]),
];
