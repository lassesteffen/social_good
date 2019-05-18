import 'dart:collection';

import 'package:scoped_model/scoped_model.dart';

import 'package:social_good/model/users.dart' show userMocks, User;
import 'package:social_good/model/challenges.dart'
    show challengeMocks, Challenge, Supporter;

class AppModel extends Model {
  /// Internal, private state of the cart.
  List<Challenge> _challenges = [];
  List<User> _users = [];
  User _user = User();

  void loadData() {
    _challenges = challengeMocks;
    _users = userMocks;
    _user = users[0];
    notifyListeners();
  }

  User get currentUser => _user;

  List<User> get users => _users;

  User user(id) => _users.firstWhere((User user) => user.id == id);

  List<Challenge> get challenges => _challenges;

  UnmodifiableListView<Challenge> get myActiveChallenges {
    return UnmodifiableListView(_challenges.where((Challenge challenge) =>
        challenge.contestant == currentUser && challenge.finishedAt == null));
  }

  UnmodifiableListView<Challenge> get myFinishedChallenges {
    return UnmodifiableListView(_challenges.where((Challenge challenge) =>
        challenge.contestant == currentUser && challenge.finishedAt != null));
  }

  UnmodifiableListView<Challenge> get myActiveSupportedChallenges {
    return UnmodifiableListView(_challenges.where((Challenge challenge) =>
        challenge.supporters
            .map((Supporter supporter) => supporter.user)
            .contains(currentUser) &&
        challenge.finishedAt != null));
  }

  UnmodifiableListView<Challenge> get myFinishedSupportedChallenges {
    return UnmodifiableListView(_challenges.where((Challenge challenge) =>
        challenge.supporters
            .map((Supporter supporter) => supporter.user)
            .contains(currentUser) &&
        challenge.finishedAt != null));
  }

  Challenge challenge(id) =>
      _challenges.firstWhere((Challenge challenge) => challenge.id == id);

  void addChallenge(Challenge challenge) {
    _challenges.insert(0, challenge);
    notifyListeners();
  }

  void supportChallenge(String challengeId, User supporter, double amount) {
    Challenge currentChallenge = challenge(challengeId);
    final Supporter supporter = Supporter(currentUser, amount);
    currentChallenge.supporters.add(supporter);
    notifyListeners();
  }

  void finishChallenge(String challengeId) {
    Challenge currentChallenge = challenge(challengeId);
    currentChallenge.finishedAt = DateTime.now();
    notifyListeners();
  }
}
