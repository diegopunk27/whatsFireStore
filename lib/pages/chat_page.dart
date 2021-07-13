import 'package:flutter/material.dart';
import 'package:whatsfire/db.dart';
import 'package:whatsfire/models/groups.dart';
import 'package:whatsfire/models/message.dart';
import 'package:whatsfire/widgets/circular_progress.dart';
import 'package:whatsfire/widgets/error_center.dart';
import 'package:whatsfire/widgets/message_box.dart';
import 'package:whatsfire/widgets/messages_list.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool changeInput;
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    changeInput = false;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Groups grupo = ModalRoute.of(context).settings.arguments;
    controlChangeText().listen((val) {
      if (val) {
        setState(() {
          changeInput = true;
        });
      } else {
        setState(() {
          changeInput = false;
        });
      }
    });
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
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: MessagesList(mensajes: snapshot.data),
                  ),
                ),
                MessageBox(
                  controller: controller,
                  changeInput: changeInput,
                  onSend: (text) {
                    print(text);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Stream<bool> controlChangeText() async* {
    if (controller.text.trim() == "") {
      yield false;
    } else if (controller.text.trim() != "") {
      yield true;
    }
  }
}
