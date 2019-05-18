import 'package:flutter/material.dart';
import './tabs/profile.dart' show Profile;
import './tabs/add.dart' show Add;
import './tabs/history.dart' show History;
import './tabs/notifications.dart' show Notifications;
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
    History(),
    Add(),
    Notifications(),
    Profile(),
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
        title: const Text('Some Title'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
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
