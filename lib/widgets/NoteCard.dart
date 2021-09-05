import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../classes/Note.dart';

class NoteCard extends StatefulWidget {
  final Note note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isOpened = !isOpened;
          });
        },
        child: Card(
          margin: EdgeInsets.fromLTRB(8, 6, 8, 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: isOpened ? Curves.easeOutBack : Curves.easeInBack,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    style: isOpened ? BorderStyle.solid : BorderStyle.none,
                    width: 1.8,
                    color: Theme.of(context).primaryColor)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInBack,
                    //height: isOpened ? 500 : 100,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(16, 10, 16, 8),
                    child: Text(
                      widget.note.text,
                      maxLines: isOpened ? 500 : 5,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Divider(),
                  isOpened
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // names
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 12, 5),
                                    child: Text(
                                      'Важность:',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 12, 5),
                                    child: Text(
                                      'Редактировано:',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 12, 10),
                                    child: Text(
                                      'Создано:',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )),
                              ],
                            ),
                            // data
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 12, 5),
                                    child: Text(
                                      widget.note.weight.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 12, 5),
                                    child: Text(
                                      DateFormat('dd-MM-yyyy HH:mm')
                                          .format(widget.note.editDate),
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 12, 10),
                                    child: Text(
                                      DateFormat('dd-MM-yyyy HH:mm')
                                          .format(widget.note.createDate),
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ))
                              ],
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 12, 10),
                                  child: Text(
                                    DateFormat('dd-MM-yyyy HH:mm')
                                        .format(widget.note.createDate),
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ))
                            ])
                ]),
          ),
        ));
  }
}
