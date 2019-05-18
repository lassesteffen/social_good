import 'users.dart';

class Supporter {
  final User user;
  final double amount;

  const Supporter({
    this.user,
    this.amount,
  });
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
  int raisedAmount;
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
    this.raisedAmount,
    this.description,
    this.createdAt,
  });
}

List<Challenge> challengeMocks = [
  Challenge(
    id: '123',
    title: 'I WILL JUMP INTO LAKE GRIEBNITZSEE',
    distance: '1km from you',
    description: 'this is awesome',
    fundingGoal: 100,
    raisedAmount: 20,
    contestant: userMocks[0],
  ),
  Challenge(
    id: '124',
    title: 'I WILL EAT 1KG OF MEAT',
    distance: '5km from you',
    description: 'this is REALLY A GREAT MEAL',
    fundingGoal: 20,
    raisedAmount: 5,
    contestant: userMocks[1],
  ),
  Challenge(
    id: '126',
    title: 'I will clean the sidewalk',
    distance: 'Nearby',
    description: 'this is awesome',
    fundingGoal: 10,
    raisedAmount: 1,
    contestant: userMocks[2],
  ),
  Challenge(
    id: '1211',
    title: 'I will annoy my neighbours',
    distance: 'Directly next to you',
    description: 'this is awesome',
    fundingGoal: 5,
    raisedAmount: 4,
    contestant: userMocks[4],
  ),
  Challenge(
    id: '124',
    title: 'I will help out at the soup kitchen',
    distance: '5km from you',
    description: 'this is awesome',
    fundingGoal: 10,
    raisedAmount: 2,
    contestant: userMocks[0],
  ),
  Challenge(
    id: '124',
    title: 'I will give out Free Hugs',
    distance: '500m from you',
    description: 'this is awesome',
    fundingGoal: 15,
    raisedAmount: 7,
    contestant: userMocks[4],
  ),
  Challenge(
    id: '124',
    title: 'I will embarass myself in public',
    distance: '800m from you',
    description: 'this is awesome',
    fundingGoal: 20,
    raisedAmount: 8,
    contestant: userMocks[3],
  ),
];
