import 'package:cloud_firestore/cloud_firestore.dart';


class MyMovie{
  String id;
  String name;
  int length;
  Timestamp dateCompleted;

  MyMovie({
    this.id,
    this.name,
    this.length,
    this.dateCompleted,
  });
}