import 'package:flutter/material.dart';
import 'package:whatsfire/models/message.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    @required this.mensajes,
  });

  final List<Message> mensajes;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        reverse: true,
        itemCount: mensajes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mensajes[index].text),
            subtitle: Text(mensajes[index].datetime.toString()),
          );
        },
      ),
    );
  }
}
