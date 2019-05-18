import 'dart:collection';

import 'package:scoped_model/scoped_model.dart';

import 'package:social_good/model/users.dart';
import 'package:social_good/model/challenges.dart';

class AppModel extends Model {
  /// Internal, private state of the cart.
  final List<Challenge> _challenges = [];
  final List<User> _users = [];
  final User _user = User();

  User get currentUser => _user;

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  User user(id) => _users.firstWhere((User user) => user.id == id);

  UnmodifiableListView<Challenge> get challenges =>
      UnmodifiableListView(_challenges);

  Challenge challenge(id) =>
      _challenges.firstWhere((Challenge challenge) => challenge.id == id);

  void addChallenge(Challenge challenge) {
    _challenges.add(challenge);
    notifyListeners();
  }
}
