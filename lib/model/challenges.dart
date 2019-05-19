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
        Supporter(userMocks[3], 1),
      ],
      contestant: userMocks[2],
      tags: ['society']),
  Challenge(
      id: '100',
      title: 'I will plant three new trees',
      distance: 'Potsdam, 10km from you ',
      description:
          'I work for a tree nursery and there are some trees left. If you support my challenge, I will do something for the society and plant some trees in the local park.',
      fundingGoal: 60,
      contestant: userMocks[3],
      supporters: [
        Supporter(userMocks[4], 2),
        Supporter(userMocks[1], 3),
        Supporter(userMocks[2], 15),
      ],
      tags: [
        'society'
      ]),
  Challenge(
      id: '101',
      title: 'I will spray an unused building',
      distance: 'Berlin, 20 km from you',
      description:
          'I’m interested in graffiti and in my neighborhood is a big grey and unused building. To make it more colorful, I want to improve my skills and spray a graffiti on the wall.',
      fundingGoal: 25,
      contestant: userMocks[1],
      supporters: [
        Supporter(userMocks[4], 2),
        Supporter(userMocks[2], 3),
      ],
      tags: [
        'styling'
      ]),
  Challenge(
      id: '102',
      title: 'I will run a marathon',
      distance: 'Berlin, 12 km from you ',
      description:
          'I want to run a famous marathon, but I can’t motivate myself to train. If I would do something for social good, it would be an extra motivation for me.',
      fundingGoal: 8,
      contestant: userMocks[4],
      supporters: [
        Supporter(userMocks[1], 2),
        Supporter(userMocks[2], 3),
      ],
      tags: [
        'personal goals'
      ]),
  Challenge(
      id: '124',
      title: 'I will eat 2 kg of celery',
      distance: 'Nearby',
      description: 'Why not? ;)',
      fundingGoal: 10,
      supporters: [
        Supporter(userMocks[3], 10),
      ],
      contestant: userMocks[0],
      finishedAt: DateTime.now(),
      proof: 'assets/proof-celery.jpg',
      tags: ['food', 'funny', 'crazy']),
  Challenge(
      id: '123',
      title: 'I will present the best App ever in front of a huge crowd',
      distance: 'Nearby',
      description:
          'We want to motivate people to do charitable work and make them recognize how gratifiying it can be to help people!!!!',
      fundingGoal: 1,
      supporters: [
        Supporter(userMocks[1], 1),
      ],
      contestant: userMocks[0],
      tags: ['society']),
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
      supporters: [Supporter(userMocks[0], 10)],
      finishedAt: DateTime.now(),
      proof: 'assets/proof-soup.jpg',
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
        Supporter(userMocks[1], 3),
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
  Challenge(
      id: '123',
      title: 'I WILL JUMP into Griebnitzsee',
      distance: 'Nearby',
      description:
          'I\'ve been hacking all day at the HPI Hackathon and need some refreshment. For 10 bucks I\'ll jump into the Griebnitzsee!!!',
      fundingGoal: 10,
      supporters: [
        Supporter(userMocks[0], 9),
        Supporter(userMocks[4], 1),
      ],
      finishedAt: DateTime.now(),
      proof: 'assets/proof-griebnitz.jpg',
      contestant: userMocks[1],
      tags: ['society']),
];
