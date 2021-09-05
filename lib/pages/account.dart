import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animations/loading_animations.dart';

class Account extends StatefulWidget {
  const Account({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: Theme.of(context).textTheme.headline1)),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingFlipping.circle(
                borderSize: 0,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              LoadingFlipping.circle(
                borderSize: 0,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              LoadingFlipping.circle(
                borderSize: 0,
                backgroundColor: Theme.of(context).primaryColor,
              )
            ]
          )
        ],
        )
    );
  }
}


