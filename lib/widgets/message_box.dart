import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    @required this.controller,
    @required this.changeInput,
    @required this.onSend,
  });

  final TextEditingController controller;
  final bool changeInput;
  final Function onSend;

  void _send(String text) {
    onSend(text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    //blurRadius: 5,
                    offset: Offset(0, 1.5),
                  ),
                  BoxShadow(color: Colors.white),
                ],
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Colors.teal,
                  width: 1,
                ),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50), right: Radius.circular(50)),
              ),
              padding: EdgeInsets.only(left: 20),
              child: TextField(
                controller: controller,
                onSubmitted: _send,
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  hintText: "Escriba un mensaje...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _send(controller.text);
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      //blurRadius: 5,
                      offset: Offset(0, 1.5),
                    ),
                    BoxShadow(color: Colors.white),
                  ],
                ),
                child: Icon(
                  changeInput ? Icons.send : Icons.mic,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
