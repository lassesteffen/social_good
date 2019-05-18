import 'package:flutter/material.dart';

const List chats = [
  {
    'user': 'User',
    'title': 'Title',
  },
  {
    'user': 'User1',
    'title': 'Title2',
  },
];

class Chats extends StatelessWidget {
  Widget build(BuildContext context) {
    final List<Widget> previews = chats.map(_buildChatPreview).toList();

    return Container(
      child: ListView(
        children: previews,
      ),
      padding: EdgeInsets.only(top: 10),
    );
  }

  Widget _buildChatPreview(preview) {
    return ChatPreview(image: preview['title'], user: preview['user']);
  }
}

class ChatPreview extends StatelessWidget {
  final String image;
  final String user;

  ChatPreview({Key key, this.image, this.user}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Row(
          children: <Widget>[
            Material(
              child: Image.asset(
                'assets/profile.jpeg',
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              clipBehavior: Clip.hardEdge,
            ),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Nickname: $user',
                        style: TextStyle(color: Colors.red),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                    ),
                    Container(
                      child: Text(
                        'About me: $user',
                        style: TextStyle(color: Colors.red),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 20.0),
              ),
            ),
          ],
        ),
        onPressed: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => Chat(
//                        peerId: document.documentID,
//                        peerAvatar: document['photoUrl'],
//                      )));
        },
        color: Color(0xffE8E8E8),
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
    );
  }
}
