import 'users.dart';

class Challenge {
  final String id;
  final String title;
  final String distance;
  final String description;
  final List<String> tags;
  final User contestant;
  final int fundingGoal;
  final int raisedAmount;

  const Challenge({
    this.id,
    this.title,
    this.tags,
    this.contestant,
    this.distance,
    this.fundingGoal,
    this.raisedAmount,
    this.description,
  });
}

List<Challenge> challengeMocks = [
  Challenge(
    id: '123',
    title: 'I WILL JUMP INTO LAKE GRIEBNITZSEE',
    distance: '1km',
    description: 'this is awesome',
    fundingGoal: 100,
    raisedAmount: 20,
    contestant: userMocks[0],
  ),
  Challenge(
    id: '124',
    title: 'I WILL JUMP INTO LAKE GRIEBNITZSEE',
    distance: '5km',
    description: 'this is awesome',
    fundingGoal: 120,
    raisedAmount: 40,
    contestant: userMocks[0],
  )
];
