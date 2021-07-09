import 'package:flutter/material.dart';
import 'package:whatsfire/db.dart' as db;
import 'package:whatsfire/models/groups.dart';
import 'package:whatsfire/widgets/error_center.dart';
import 'package:whatsfire/widgets/groups_list.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsFire"),
      ),
      body: StreamBuilder(
        stream: db.getGroups(),
        builder: (context, AsyncSnapshot<List<Groups>> snapshot) {
          if (snapshot.hasError) {
            return ErrorCenter(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            return GroupsList(docs: snapshot.data);
          }
        },
      ),
    );
  }
}
