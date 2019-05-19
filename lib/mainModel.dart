import 'dart:collection';

import 'package:scoped_model/scoped_model.dart';

import 'package:social_good/model/users.dart' show userMocks, User;
import 'package:social_good/model/projects.dart' show projectMocks, Project;
import 'package:social_good/model/challenges.dart'
    show challengeMocks, Challenge, Supporter;

class AppModel extends Model {
  /// Internal, private state of the cart.
  List<Challenge> _challenges = [];
  List<User> _users = [];
  User _user = User();
  List<Project> _projects = [];

  void loadData() {
    _challenges = challengeMocks;
    _users = userMocks;
    _user = users[0];
    _projects = projectMocks;
    notifyListeners();
  }

  User get currentUser => _user;

  List<User> get users => _users;

  User user(id) => _users.firstWhere((User user) => user.id == id);

  List<Project> get projects => _projects;

  List<Challenge> get challenges => _challenges;

  UnmodifiableListView<Challenge> get upcomingChallenges {
    return UnmodifiableListView(challenges
        .where((Challenge challenge) => challenge.finishedAt == null));
  }

  UnmodifiableListView<Challenge> get completedChallenges {
    return UnmodifiableListView(challenges
        .where((Challenge challenge) => challenge.finishedAt != null));
  }

  UnmodifiableListView<Challenge> get myActiveChallenges {
    return UnmodifiableListView(upcomingChallenges
        .where((Challenge challenge) => challenge.contestant == currentUser));
  }

  UnmodifiableListView<Challenge> get myCompletedChallenges {
    return UnmodifiableListView(completedChallenges
        .where((Challenge challenge) => challenge.contestant == currentUser));
  }

  UnmodifiableListView<Challenge> get myActiveSupportedChallenges {
    return UnmodifiableListView(upcomingChallenges.where(
        (Challenge challenge) => challenge.supporters
            .map((Supporter supporter) => supporter.user)
            .contains(currentUser)));
  }

  UnmodifiableListView<Challenge> get myCompletedSupportedChallenges {
    return UnmodifiableListView(completedChallenges.where(
        (Challenge challenge) => challenge.supporters
            .map((Supporter supporter) => supporter.user)
            .contains(currentUser)));
  }

  UnmodifiableListView<Challenge> get myFeedChallenges {
    return UnmodifiableListView(upcomingChallenges.where(
        (Challenge challenge) =>
            challenge.contestant != currentUser &&
            !challenge.supporters
                .map((Supporter supporter) => supporter.user)
                .contains(currentUser)));
  }

  Challenge challenge(id) =>
      _challenges.firstWhere((Challenge challenge) => challenge.id == id);

  void addChallenge(Challenge challenge) {
    _challenges.insert(0, challenge);
    notifyListeners();
  }

  void supportChallenge(String challengeId, double amount) {
    Challenge currentChallenge = challenge(challengeId);
    final Supporter supporter = Supporter(currentUser, amount);
    currentChallenge.supporters.add(supporter);
    notifyListeners();
  }

  void finishChallenge(String challengeId, String proofPath) {
    Challenge currentChallenge = challenge(challengeId);
    currentChallenge.finishedAt = DateTime.now();
    currentChallenge.proof = proofPath;
    notifyListeners();
  }
}
