import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String text, id;
  DateTime datetime;

  Message.fromJson(DocumentSnapshot doc)
      : text = doc.data["text"],
        id = doc.documentID,
        datetime = (doc.data["datetime"] as Timestamp).toDate();
}

List<Message> toMessagesList(QuerySnapshot query) {
  return query.documents.map((document) => Message.fromJson(document)).toList();
}
