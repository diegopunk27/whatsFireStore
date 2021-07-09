import 'package:flutter/material.dart';
import 'package:whatsfire/models/groups.dart';

class GroupTile extends StatelessWidget {
  GroupTile(this.docs);
  final Groups docs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed("/chat", arguments: docs);
      },
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.teal[400],
        ),
        height: 40,
        width: 40,
      ),
      title: Row(
        children: <Widget>[
          Text(
            docs.name,
          ),
        ],
      ),
      subtitle: Text(docs.id),
      trailing: Text(
        "07/07/2021",
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
