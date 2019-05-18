import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

class Add extends StatefulWidget {
  AddState createState() => AddState();
}

class AddState extends State<Add> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _untilController = TextEditingController();

  FocusNode _titleFocusNode = FocusNode();
  FocusNode _descriptionFocusNode = FocusNode();
  FocusNode _amountFocusNode = FocusNode();
  FocusNode _untilFocusNode = FocusNode();

  List<Tag> _tags=[
    Tag(id: 0, title: 'funny', active: false),
    Tag(id: 0, title: 'voluntary', active: false),
    Tag(id: 0, title: 'water', active: false),
    Tag(id: 0, title: 'food', active: false),
    Tag(id: 0, title: 'kids', active: false),
    Tag(id: 0, title: 'sport', active: false),
    Tag(id: 0, title: 'styling', active: false),
    Tag(id: 0, title: 'personal goals', active: false),
    Tag(id: 0, title: 'society', active: false),
    Tag(id: 0, title: 'family', active: false),
    Tag(id: 0, title: 'friends', active: false),
    Tag(id: 0, title: 'activity', active: false),
  ];

  double _marginBetweenWidgets = 15;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Challenge'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              focusNode: _titleFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _titleFocusNode, _descriptionFocusNode);
              },
              decoration: InputDecoration(labelText: 'Challenge Title'),
            ),
            SizedBox(height: _marginBetweenWidgets),
            TextFormField(
              controller: _descriptionController,
              focusNode: _descriptionFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _descriptionFocusNode, _untilFocusNode);
              },
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: _marginBetweenWidgets),
            TextFormField( // TODO: this should become a Datepicker instead of a normal textfield
              controller: _untilController,
              focusNode: _untilFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _untilFocusNode, _amountFocusNode);
              },
              decoration: InputDecoration(labelText: 'Until'),
            ),
            SizedBox(height: _marginBetweenWidgets),
            TextFormField(
              controller: _amountController,
              focusNode: _amountFocusNode,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Amount', prefixText: '\$'),
            ),
            SizedBox(height: _marginBetweenWidgets * 2),
            Text('Tags'),
            SizedBox(height: _marginBetweenWidgets),
            SelectableTags(
              tags: _tags,
              columns: 5, // default 4
              symmetry: false, // default false
            ),
            SizedBox(height: _marginBetweenWidgets * 3),
            RaisedButton(
              child: Text('Submit'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => _submitChallenge(context),
            ),
            SizedBox(height: _marginBetweenWidgets * 2),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
              size: 50.0,
            ),
            Text('Scroll down for some inspiration', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            
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
