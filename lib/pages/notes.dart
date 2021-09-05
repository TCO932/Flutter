import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import '../classes/Note.dart';
import '../popups/addNote.dart';
import '../widgets/NoteCard.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  bool importantFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.headline1),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      drawer: Drawer(
          child: Container(
        color: Theme.of(context).primaryColorLight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100.0,
              child: DrawerHeader(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Text('Меню',
                      style: Theme.of(context).textTheme.headline1)),
            ),
            ListTile(
              title: Text('Настройки',
                  style: Theme.of(context).textTheme.bodyText1),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title:
                  Text('Аккаунт', style: Theme.of(context).textTheme.bodyText1),
              onTap: () {
                Navigator.pushNamed(context, '/account');
              },
            ),
            ListTile(
              title: Text('О приложении',
                  style: Theme.of(context).textTheme.bodyText1),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      )),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('notes')
            .orderBy('weight', descending: importantFirst)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  LoadingFlipping.circle(
                    borderSize: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: LoadingFlipping.circle(
                      borderSize: 0,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  LoadingFlipping.circle(
                    borderSize: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                  )
                ])
              ],
            );
          else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                      background: Container(
                        margin: EdgeInsets.only(left: 30.0, right: 30.0),
                        //color: Colors.red[100],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.delete,
                                color:
                                    Theme.of(context).primaryIconTheme.color),
                            Icon(Icons.delete,
                                color: Theme.of(context).primaryIconTheme.color)
                          ],
                        ),
                      ),
                      key: Key(snapshot.data!.docs[index].id),
                      onDismissed: (direction) {
                        FirebaseFirestore.instance
                            .collection('notes')
                            .doc(snapshot.data!.docs[index].id)
                            .delete();
                      },
                      child: GestureDetector(
                        onLongPress: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AddNotePopUp(
                                text: snapshot.data!.docs[index].get('note'),
                                addNote: (text, weight) {
                                  FirebaseFirestore.instance
                                      .collection('notes')
                                      .doc(snapshot.data!.docs[index].id)
                                      .update({
                                    'note': text,
                                    'edit_date': DateTime.now(),
                                    'weight': weight
                                  });
                                })),
                        child: NoteCard(
                          note: Note.withTimestamp(
                            snapshot.data!.docs[index].get('note'),
                            snapshot.data!.docs[index].get('weight'),
                            snapshot.data!.docs[index].get('create_date'),
                            snapshot.data!.docs[index].get('edit_date'),
                          ),
                        ),
                      ));
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AddNotePopUp(addNote: (text, weight) {
                  FirebaseFirestore.instance.collection('notes').add({
                    'note': text,
                    'create_date': DateTime.now(),
                    'edit_date': DateTime.now(),
                    'weight': weight,
                  });
                })),
      ),
    );
  }
}
