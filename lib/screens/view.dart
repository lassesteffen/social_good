import 'package:flutter/material.dart';
import './tabs/profile.dart' show Profile;
import './tabs/add.dart' show Add;
import './tabs/history.dart' show History;
import './tabs/supported_challenges.dart' show MySupportedChallenges;
import './tabs/newsfeed.dart' show Feed;

class View extends StatefulWidget {
  View({Key key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Feed(),
    MySupportedChallenges(),
    Text('Add'),
    History(),
    Profile(),
  ];

  static List<String> _widgetTitles = <String>[
    'Feed',
    'Supported Challenges',
    'Add',
    'My Challenges',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return Add();
            },
            fullscreenDialog: true,
          ),
        );
      } else {
        _selectedIndex = index;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetTitles.elementAt(_selectedIndex)),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Supporting'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Mine'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
