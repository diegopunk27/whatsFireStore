import 'package:flutter/material.dart';
import 'package:whatsfire/db.dart' as db;
import 'package:whatsfire/models/groups.dart';
import 'package:whatsfire/widgets/group_tile.dart';

class GroupePage extends StatelessWidget {
  const GroupePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsFire"),
      ),
      body: StreamBuilder(
        stream: db.conection(),
        builder: (context, AsyncSnapshot<List<Groups>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Se produjo un error ${snapshot.error}"),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<Groups> docs = snapshot.data;
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
        },
      ),
    );
  }
}
