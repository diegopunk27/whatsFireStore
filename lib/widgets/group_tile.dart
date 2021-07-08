import 'package:flutter/material.dart';
import 'package:whatsfire/models/groups.dart';

class GroupTile extends StatelessWidget {
  GroupTile(this.docs);
  final Groups docs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal[400],
        maxRadius: 25,
      ),
      title: Text(
        docs.name,
      ),
      subtitle: Text(docs.id),
      trailing: Text(
        "07/07/2021",
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
