import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String text;
  final int weight;
  DateTime createDate = DateTime.now();
  DateTime editDate = DateTime.now();

  Note(this.text, this.weight);

  Note.withTimestamp(this.text, this.weight, Timestamp createTimestamp,
      Timestamp editTimestamp) {
    this.createDate = createTimestamp.toDate();
    this.editDate = editTimestamp.toDate();
  }

  int compare(Note a, Note b) {
    if (a.weight == b.weight) return 0;
    if (a.weight < b.weight)
      return -1;
    else
      return 1;
  }
}
