import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 class About extends StatelessWidget {
   const About({Key? key, required this.title}) : super(key: key);

   final String title;

   @override
   Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title, style: Theme.of(context).textTheme.headline1),
        ),
        backgroundColor: Colors.black,
        body: Text('''
 A long time ago,
 in a galaxy far, far away...
 
 It is a period of civil war. Rebel
 spaceships, striking from a hidden
 base, have won their first victory
 against the evil Galactic Empire.
 During the battle, Rebel spies managed
 to steal secret plans to the Empire's
 ultimate weapon, the Death Star, an
 armored space station with enough
 power to destroy an entire planet.
 Pursued by the Empire's sinister agents,
 Princess Leia races home aboard her
 starship, custodian of the stolen plans
 that can save her people and restore
 freedom to the galaxy....''',
         textAlign: TextAlign.center,
         style: TextStyle(
           color: Colors.white,
           fontSize: 23,
         ),
        )
     );
   }
 }
