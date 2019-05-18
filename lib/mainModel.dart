import 'dart:collection';

import 'package:scoped_model/scoped_model.dart';

import 'package:social_good/model/users.dart' show userMocks, User;
import 'package:social_good/model/challenges.dart'
    show challengeMocks, Challenge;

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

  Challenge challenge(id) =>
      _challenges.firstWhere((Challenge challenge) => challenge.id == id);

  void addChallenge(Challenge challenge) {
    _challenges.add(challenge);
    notifyListeners();
  }
}
