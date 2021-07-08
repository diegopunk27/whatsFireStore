import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsfire/models/groups.dart';

Stream<List<Groups>> conection() {
  return Firestore.instance
      .collection("groups")
      .orderBy("name")
      .snapshots()
      .map((dato) => toGroupList(dato));
}
