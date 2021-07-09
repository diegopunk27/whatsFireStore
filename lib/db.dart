import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsfire/models/groups.dart';
import 'package:whatsfire/models/message.dart';

Stream<List<Groups>> getGroups() {
  return Firestore.instance
      .collection("groups")
      .orderBy("name")
      .snapshots()
      .map((dato) => toGroupList(
          dato)); // Forma 1 de llamar a la funcion que enlista en un map
}

Stream<List<Message>> getMessages(String idGroup) {
  return Firestore.instance
      .collection("groups/$idGroup/messages")
      .snapshots()
      .map(
          toMessagesList); // Forma 2 de llamar a la funcion que enlista en un map
}
