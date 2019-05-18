import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  AddState createState() => AddState();
}

class AddState extends State<Add> {
  TextEditingController _xController = TextEditingController();
  TextEditingController _yController = TextEditingController();

  FocusNode _xFocusNode = FocusNode();
  FocusNode _yFocusNode = FocusNode();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Challenge'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Text('Create your own challenge here!'),
            TextFormField(
              controller: _xController,
              focusNode: _xFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _xFocusNode, _yFocusNode);
              },
              decoration: InputDecoration(labelText: 'x'),
            ),
            TextFormField(
              controller: _yController,
              focusNode: _yFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term) => _submitChallenge(context),
              decoration: InputDecoration(labelText: 'y'),
            ),
            RaisedButton(
              child: Text('Submit'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => _submitChallenge(context),
            )
          ],
        ),
      ),
    );
  }

  void _submitChallenge(BuildContext context) {
    Navigator.pop(context);
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
