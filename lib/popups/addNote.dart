import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNotePopUp extends StatefulWidget {
  final Function addNote;
  final String text;
  final String weight;

  const AddNotePopUp(
      {Key? key, required this.addNote, this.text = '', this.weight = '1'})
      : super(key: key);

  @override
  _AddNotePopUpState createState() => _AddNotePopUpState();
}

class _AddNotePopUpState extends State<AddNotePopUp> {
  final textInputController = TextEditingController();
  final weightInputController = TextEditingController();

  @override
  void dispose() {
    textInputController.dispose();
    weightInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textInputController.text = widget.text;
    weightInputController.text = widget.weight;
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColorLight,
      title:
          Text('Новая заметка', style: Theme.of(context).textTheme.headline1),
      content: IntrinsicHeight(
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 3,
              controller: textInputController,
              autofocus: true,
            ),
            TextField(
              style: Theme.of(context).textTheme.bodyText1,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              keyboardType: TextInputType.number,
              controller: weightInputController,
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'OK'),
            widget.addNote(
                textInputController.text, int.parse(weightInputController.text))
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
