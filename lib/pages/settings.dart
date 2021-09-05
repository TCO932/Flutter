import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: Theme.of(context).textTheme.headline1),),
      backgroundColor: Colors.yellowAccent.shade700,
      body: Text('Settings', textAlign: TextAlign.center,),
    );
  }
}
