import 'package:flutter/material.dart';

class StatelessWidgetName extends StatelessWidget {
  const StatelessWidgetName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class StatefulWidgetName extends StatefulWidget {
  const StatefulWidgetName({Key? key}) : super(key: key);

  @override
  _StatefulWidgetNameState createState() => _StatefulWidgetNameState();
}

class _StatefulWidgetNameState extends State<StatefulWidgetName> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
