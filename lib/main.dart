// Flutter code sample for material.BottomNavigationBar.1

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:social_good/routes.dart' show routes;
import 'package:social_good/mainModel.dart' show AppModel;

void main() {
  final model = AppModel();
  model.loadData();

  runApp(
    ScopedModel<AppModel>(
      model: model,
      child: MyApp(),
    ),
  );
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: 'View',
      routes: routes,
      theme: ThemeData(
        primaryColor: Color(0xff3f6184),
        accentColor: Color(0xff3f6178),
      ),
    );
  }
}
