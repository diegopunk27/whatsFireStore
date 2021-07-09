import 'package:flutter/material.dart';
import 'package:whatsfire/db.dart';
import 'package:whatsfire/models/groups.dart';
import 'package:whatsfire/models/message.dart';
import 'package:whatsfire/widgets/circular_progress.dart';
import 'package:whatsfire/widgets/error_center.dart';
import 'package:whatsfire/widgets/messages_list.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Groups grupo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(grupo.name),
      ),
      body: StreamBuilder(
        stream: getMessages(grupo.id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasError) {
            return ErrorCenter(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return CircularProgress();
          }
          if (snapshot.hasData) {
            return MessagesList(mensajes: snapshot.data);
          }
        },
      ),
    );
  }
}
