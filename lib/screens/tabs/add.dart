import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';
import 'package:social_good/model/challenges.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_good/mainModel.dart'
  show AppModel;

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
    Tag(title: 'funny', active: false),
    Tag(title: 'voluntary', active: false),
    Tag(title: 'water', active: false),
    Tag(title: 'food', active: false),
    Tag(title: 'kids', active: false),
    Tag(title: 'sport', active: false),
    Tag(title: 'styling', active: false),
    Tag(title: 'personal goals', active: false),
    Tag(title: 'society', active: false),
    Tag(title: 'family', active: false),
    Tag(title: 'friends', active: false),
    Tag(title: 'activity', active: false),
  ];

  double _marginBetweenWidgets = 12;

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
            SizedBox(height: _marginBetweenWidgets * 1.5),
            Text('Tags'),
            SizedBox(height: _marginBetweenWidgets),
            SelectableTags(
              tags: _tags,
              backgroundContainer: Color(0xfffafafa),
              columns: 5, // default 4
              symmetry: false, // default false
            ),
            SizedBox(height: _marginBetweenWidgets * 1.5),
            RaisedButton(
              child: Text('Do It!'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => _submitChallenge(context),
            ),
            SizedBox(height: _marginBetweenWidgets * 1.5),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
              size: 50.0,
            ),
            Text('Scroll down for some inspiration', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets * 5),
            Text('Do something crazy and leave your comfort zone', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Go Skydiving!', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Start conversations with 3 strangers', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Read a book to a child', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            SizedBox(height: _marginBetweenWidgets),
            Text('Help a pensioner at garden work', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  void _submitChallenge(BuildContext context) {
    AppModel model = ScopedModel.of<AppModel>(context);
    model.addChallenge(Challenge(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      distance: 'Nearby',
      description: _descriptionController.text,
      fundingGoal: int.parse(_amountController.text),
      contestant: model.currentUser,
      supporters: [],
      tags: _tags.where((tag) => tag.active).map((tag) => tag.title).toList()
  ));
    Navigator.pop(context);
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
