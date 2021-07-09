import 'package:flutter/material.dart';
import 'package:whatsfire/pages/group_page.dart';
import 'package:whatsfire/pages/chat_page.dart';

void main() {
  runApp(WhatsFire());
}

class WhatsFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clone Whatsapp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => GroupePage(),
        "/chat": (_) => ChatPage(),
      },
    );
  }
}
