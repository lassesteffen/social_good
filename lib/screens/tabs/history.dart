import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_good/mainModel.dart' show AppModel;

class History extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, appModel) {
        return Text('Hallo');
      },
    );
  }
}
