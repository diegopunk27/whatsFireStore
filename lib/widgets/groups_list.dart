import 'package:flutter/material.dart';
import 'package:whatsfire/models/groups.dart';
import 'package:whatsfire/widgets/group_tile.dart';

class GroupsList extends StatelessWidget {
  GroupsList({
    @required this.docs,
  });

  final List<Groups> docs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        return GroupTile(docs[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
          color: Colors.black38,
          indent: 75,
          endIndent: 15,
        );
      },
    );
  }
}
