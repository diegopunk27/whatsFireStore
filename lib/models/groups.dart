import 'package:cloud_firestore/cloud_firestore.dart';

class Groups {
  String id;
  String name;

  Groups.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        name = doc.data["name"];
}

List<Groups> toGroupList(QuerySnapshot query) {
  return query.documents
      .map((document) => Groups.fromFirestore(document))
      .toList();
}
