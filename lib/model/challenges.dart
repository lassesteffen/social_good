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
  });
}

List<Challenge> challengeMocks = [
  Challenge(
    id: '123',
    title: 'JUMP INTO GRIEBNITZSEE',
    distance: 'Nearby',
    description: 'this is awesome',
    fundingGoal: 100,
    supporters: [
      Supporter(userMocks[1], 18),
      Supporter(userMocks[2], 1),
    ],
    contestant: userMocks[0],
    tags: ['funny', 'sport', 'crazy']
  ),
  Challenge(
    id: '124',
    title: 'I WILL EAT 1KG OF MEAT',
    distance: '5km from you',
    description: 'this is REALLY A GREAT MEAL',
    fundingGoal: 20,
    supporters: [
      Supporter(userMocks[4], 3),
    ],
    contestant: userMocks[1],
    tags: ['food']
  ),
  Challenge(
    id: '126',
    title: 'I will clean the sidewalk',
    distance: 'Nearby',
    description: 'this is awesome',
    fundingGoal: 10,
    contestant: userMocks[2],
    supporters: [
      Supporter(userMocks[1], 2),
      Supporter(userMocks[0], 1),
    ],
    tags: ['society', 'voluntary']
  ),
  Challenge(
    id: '1211',
    title: 'I will annoy my neighbours',
    distance: 'Directly next to you',
    description: 'this is awesome',
    fundingGoal: 5,
    contestant: userMocks[4],
    supporters: [
      Supporter(userMocks[1], 1),
      Supporter(userMocks[3], 1),
    ],
    tags: ['unnecessary', 'weird']
  ),
  Challenge(
    id: 'amkaud',
    title: 'I will help out at the soup kitchen',
    distance: 'Nearby',
    description: 'this is awesome',
    fundingGoal: 10,
    contestant: userMocks[0],
    supporters: [],
    tags: ['voluntary', 'food', 'helping']
  ),
  Challenge(
    id: 'aaaa',
    title: 'I will give out Free Hugs',
    distance: '500m from you',
    description: 'this is awesome',
    fundingGoal: 15,
    contestant: userMocks[4],
    supporters: [
      Supporter(userMocks[2], 1),
      Supporter(userMocks[0], 3),
      Supporter(userMocks[0], 11),
    ],
    finishedAt: DateTime.now(),
    tags: ['friendship']
  ),
  Challenge(
    id: '12bbbb4',
    title: 'I will embarass myself in public',
    distance: '800m from you',
    description: 'this is awesome',
    fundingGoal: 20,
    contestant: userMocks[3],
    supporters: [
      Supporter(userMocks[4], 2),
      Supporter(userMocks[0], 3),
      Supporter(userMocks[0], 15),
    ],
    finishedAt: DateTime.now(),
    tags: ['funny', 'crazy']
  ),
];
